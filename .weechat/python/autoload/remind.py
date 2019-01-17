#!/usr/bin/env python
import weechat
import re
from datetime import datetime

weechat.register("remind","Tom Smeding","0.1","MIT","reminder utility","","")
dashprefix=weechat.prefix("network")
errorprefix=weechat.prefix("error")


timer_map=dict()


_uniqid_current_id=0
def uniqid():
	global _uniqid_current_id
	i=_uniqid_current_id
	_uniqid_current_id+=1
	return i

def timer_cb(data,remaining_calls):
	global timer_map

	when,buf,message,priv,hook=timer_map[int(data,16)]
	del timer_map[int(data,16)]
	if priv:
		weechat.prnt(buf,message)
	else:
		weechat.command(buf,message)

	weechat.command("","/print -beep")

	return weechat.WEECHAT_RC_OK

def list_reminders(targetbuf):
	keys=sorted(timer_map,key=lambda k:timer_map[k][0])
	if len(keys)==0:
		weechat.prnt(targetbuf,"No reminders")
		return

	for k in keys:
		when,buf,message,priv,hook=timer_map[k]
		bufname=weechat.buffer_get_string(buf,"full_name")
		weechat.prnt(targetbuf,str(k)+": "+str(when)+(" [private]" if priv else "")+" in "+bufname+": "+message)

def delete_reminder(targetbuf,num):
	if timer_map[num]:
		weechat.unhook(hex(num))
		del timer_map[num]
		weechat.prnt(targetbuf,"Deleted reminder "+str(num))
	else:
		weechat.prnt(targetbuf,"Could not find that reminder, try '/remind list'")
		weechat.command("","/print -beep")
	return weechat.WEECHAT_RC_OK

def remind_set(buf,args,priv,cmd):
	global timer_map

	args=args.strip()
	if args=="list":
		list_reminders(buf)
		return weechat.WEECHAT_RC_OK

	m=re.match(r"delete +(\d+)$",args)
	if m:
		delete_reminder(buf,int(m.group(1)))
		return weechat.WEECHAT_RC_OK

	m=re.match(r"(\d\d):(\d\d)(.*)$",args)
	if not m:
		weechat.prnt(buf,errorprefix+"Invalid format; expected "+cmd+" 16:00 do something")
		return weechat.WEECHAT_RC_OK
	hour,minute,message=int(m.group(1)),int(m.group(2)),m.group(3).strip()

	if hour<0 or hour>=24 or minute<0 or minute>=60:
		weechat.prnt(buf,errorprefix+"Invalid time format")
		return weechat.WEECHAT_RC_OK

	now=datetime.now()
	when=datetime(now.year,now.month,now.day,hour,minute)
	if when<now:
		when=datetime(now.year,now.month,now.day+1,hour,minute)

	i=uniqid()
	hook=weechat.hook_timer((when-now).seconds*1000,0,1,"timer_cb",hex(i))
	timer_map[i]=(when,buf,message,priv,hook)

	weechat.prnt(buf,"Reminding at "+("00"+str(hour))[-2:]+":"+("00"+str(minute))[-2:])

	return weechat.WEECHAT_RC_OK

def remind_set_cb(data,buf,args):
	return remind_set(buf,args,False,"/remind")

def remind_private_set_cb(data,buf,args):
	return remind_set(buf,args,True,"/remindp")

weechat.hook_command("remind","Set a reminder in the current buffer.","[when] [message...] | list | delete [number]","  /remind [when] [message...]: Set a reminder\n    [when]: Time (e.g. \"16:00\")\n    [message]: Message to show at specified time; will be readable\n               by all channel members\n  /remind list: List current reminders\n  /remind delete [number]: Delete a reminder\n    [number]: Number of reminder to delete, run '/remind list'\n              for numbers","","remind_set_cb","")
weechat.hook_command("remindp","Sets a private reminder in the current buffer.","[when] [message...]","  See '/help remind' for more info.","","remind_private_set_cb","")
