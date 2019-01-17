#!/usr/bin/env python
# coding=utf-8
import weechat,os

weechat.register("sneeuwpop","Tom Smeding","0.1","MIT","sneeuwpop helper","","")

def send_sneeuwpop(data,buf,args):
	return weechat.command(buf,u"/say ⛄️".encode("utf-8"))

def send_sneeuwpop_ascii(data,buf,args):
	c=weechat.command(buf,"      \^^^^^^^^/")
	if c != weechat.WEECHAT_RC_OK: return c
	weechat.command(buf,"       |      |")
	weechat.command(buf,"       ##^^^^##")
	weechat.command(buf,"      # && &&  #")
	weechat.command(buf,"   __==@@       #")
	weechat.command(buf,"   ^^==@@       #")
	weechat.command(buf,"      #        #")
	weechat.command(buf,"    ##          ##")
	weechat.command(buf,"   #  &&          #")
	weechat.command(buf,"  #                #")
	weechat.command(buf,"  #  &&            #")
	weechat.command(buf,"  #                #")
	weechat.command(buf,"   #  &&          #")
	weechat.command(buf,"    #            #")
	weechat.command(buf,"   #              #")
	weechat.command(buf,"    ##############")
	return weechat.WEECHAT_RC_OK

weechat.hook_command("s",u"Send a ⛄️".encode("utf-8"),"","","","send_sneeuwpop","")
weechat.hook_command("sa",u"Send a large ascii-art snowman".encode("utf-8"),"","","","send_sneeuwpop_ascii","")
