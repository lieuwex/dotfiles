#!/usr/bin/env python
# coding=utf-8
import weechat,os
import subprocess,random

weechat.register("sneeuw","Tom Smeding","0.1","MIT","sneeuw caller","","")


def run_sneeuw():
	subprocess.call(["sneeuw", "120"])
	weechat.command("","/window refresh")

def sneeuw_cb(data,buf,args):
	run_sneeuw()
	return weechat.WEECHAT_RC_OK

def timer_cb(data,remaining_calls):
	run_sneeuw()
	return weechat.WEECHAT_RC_OK

def print_cb(data,buffer,date,tags,displayed,highlight,prefix,message):
	weechat.hook_timer(10,0,1,"timer_cb","")
	return weechat.WEECHAT_RC_OK


weechat.hook_print("","","!sneeuw",1,"print_cb","")

weechat.hook_command("sneeuw","Run sneeuw","","","","sneeuw_cb","")
