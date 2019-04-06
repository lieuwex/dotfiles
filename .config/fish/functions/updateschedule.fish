function updateschedule
	rm -rf ~/.local/share/khal
	set -l file $TMPDIR/(date +%s).ics

	curl -Ls https://www.student.universiteitleiden.nl/binaries/content/assets/science/liacs/roosters/18-19/zalen-inf-2e-jaar-najaar-18-19.xls \
		| ~/studie/utils/parserooster/index.js 'Rooster Informatica 2e jaar najaar' >$file
	khal import --batch $file

	curl -Ls https://www.student.universiteitleiden.nl/binaries/content/assets/science/liacs/roosters/18-19/zalen-inf-2e-jaar-voorjaar-18-19.xls \
		| ~/studie/utils/parserooster/index.js 'Rooster Informatica 2e jaar voorjaar' >$file
	khal import --batch $file
end
