#!/usr/bin/env python
import weechat
from datetime import datetime
import subprocess, re

weechat.register("intel_replace","Tom Smeding","0.1","MIT","intel replacer","","")


bufp=None
linetosay=None

def intlmakeEline(s):
    line=""
    while len(s)>0:
        idx=s.find("int l")
        if idx==-1: break
        line+=" "*idx+"   e "
        s=s[idx+5:]
    if len(line)==0: return None
    return line

def timer_cb(data,remaining_calls):
    global bufp,linetosay
    if bufp==None: return weechat.WEECHAT_RC_OK
    weechat.command(bufp,linetosay)
    bufp=None
    linetosay=None
    return weechat.WEECHAT_RC_OK

def modifier_cb(data,modifier,modifier_data,string):
    global bufp,linetosay
    if len(string)<2 or (string[0]=="/" and string[1]!="/"): return string
    bufp=modifier_data

    linetosay=intlmakeEline(string)
    if linetosay==None: return string

    weechat.hook_timer(10,0,1,"timer_cb","")
    return string

modhook=weechat.hook_modifier("input_text_for_buffer","modifier_cb","")
