import weechat

SCRIPT_NAME     = 'pm_info'
SCRIPT_AUTHOR   = 'Lieuwe Rooijakkers <lieuwerooijakkers@gmail.com>'
SCRIPT_VERSION  = '0.1'
SCRIPT_LICENSE  = 'GPLv3'
SCRIPT_DESC     = ''

def handleMessage(data, signal, signal_data):
    

weechat.hook_signal("*,irc_in2_PRIVMSG")
