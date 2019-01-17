#!/usr/bin/env python
import weechat
from datetime import datetime
import subprocess, re

weechat.register("rip","Tom Smeding","0.1","MIT","rip counter","","")
dashprefix=weechat.prefix("network")
errorprefix=weechat.prefix("error")


BUFFERNAME="irc.freenode.tomsmeding"
SEARCHREGEX="\\brip\\b"


nrip=0

try:
	nrip=int(subprocess.check_output("grep -i '"+SEARCHREGEX+"' ~/.weechat/logs/"+BUFFERNAME+".weechatlog 2>/dev/null | wc -l",shell=True).strip())
except:
	weechat.prnt("",dashprefix+"[rip] Warning: could not extract number from grep|wc !")
	nrip=0
weechat.prnt("",dashprefix+"[rip] number till now: "+str(nrip))


def timer_cb(data,remaining_calls):
	weechat.command(weechat.buffer_search("==",BUFFERNAME),"/say ("+str(nrip)+")")
	return weechat.WEECHAT_RC_OK

def modifier_cb(data,modifier,modifier_data,string):
	global nrip
	bufplugin,bufname=modifier_data.split(";")[0:2]
	fullname=bufplugin+"."+bufname
	if fullname.lower()!=BUFFERNAME.lower():
		return string
	# weechat.prnt("",dashprefix+"[rip] SR=<"+str(SEARCHREGEX)+"> string=<"+string+">")
	if re.search(SEARCHREGEX,string,re.IGNORECASE):
		nrip+=1
		weechat.hook_timer(10,0,1,"timer_cb","")
	return string

modhook=weechat.hook_modifier("weechat_print","modifier_cb","")
