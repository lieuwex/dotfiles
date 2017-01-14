// REVIEW: maybe always show errored when the apopointment call was errored and
// the old array was used as a cache?

var MAX_CACHE_TIME = 1000 * 60 * 30; // 30 minutes.

// just quit if it's weekend
var day = new Date().getDay();
if (day === 0 || day === 6) {
	process.exit();
}

var path = require('path');
var fs = require('fs');
var Magister = require('magister.js').Magister;

var cacheFilePath = path.join(__dirname, '/cache.json');

var old;
try {
	old = JSON.parse(fs.readFileSync(cacheFilePath));
} catch (e) {
	old = undefined;
}

// blocked will be true when we don't want to login again (wrong password, for
// example)
if (old != null && old.blocked === true) {
	console.log('ERR | ');
	process.exit();
}

function printTime (appointments) {
	for (var i = 0; i < appointments.length; i++) {
		var appointment = appointments[i];
		var seconds = (appointment.start - new Date().getTime()) / 1000;

		if (appointment.type === 13 && !appointment.scrapped && seconds > 0) {
			var hours = ~~(seconds / 3600);
			var remainder = ~~(seconds % 3600);
			var minutes = ~~(remainder / 60);

			var s = '';
			if (hours !== 0)
				s += Math.abs(hours) + 'u';
			if (minutes !== 0)
				s += Math.abs(minutes) + 'm';
			if (hours === 0 && minutes === 0)
				s = '<1m';

			console.log(s + ' | ');
			return;
		}
	}
}

function toJson (appointment) {
	return {
		start: appointment.begin().getTime(),
		type: appointment.type(),
		scrapped: appointment.scrapped(),
	};
}

if (old != null && new Date().getTime() - old.time <= MAX_CACHE_TIME) {
	printTime(old.appointments);
} else {
	new Magister({
		school: '',
		username: '',
		password: '',
	}).ready(function (e) {
		const save = obj => fs.writeFileSync(cacheFilePath, JSON.stringify(obj));

		if (e != null) {
			save({
				blocked: true,
				err: e.toString(),
				time: new Date().getTime(),
			});
		} else {
			this.appointments(new Date(), function (e, r) {
				if (e == null) {
					r = r.map(toJson);
					printTime(r);
				} else {
					r = old.appointments;
					printTime('ERR | ');
				}

				save({
					appointments: r || [],
					time: new Date().getTime(),
				});
			});
		}
	});
}
