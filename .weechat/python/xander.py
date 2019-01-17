import weechat
import re
from datetime import datetime

name = "xander"
author = "Lieuwe Rooijakkers <lieuwerooijakkers@gmail.com> (http://www.lieuwe.xyz/)"
version = "0.1"
license = "MIT"
description = "XANDER XANDER XANDER XANDER"
shutdown_function = ""
charset = ""

weechat.register(
    name,
    author,
    version,
    license,
    description,
    shutdown_function,
    charset
)


def checkTime(date):
    now = (datetime.now() - datetime.fromtimestamp(0)).total_seconds()
    return abs(float(date) - now) < 5


def msg_cb(data, buffer, date, tags, displayed, highlight, prefix, message):
    if not checkTime(date):
        return weechat.WEECHAT_RC_OK

    match = re.match("^!xander (.+)$", message, re.IGNORECASE)
    if match is None:
        return weechat.WEECHAT_RC_OK

    groups = match.groups()
    if len(groups) == 0:
        return weechat.WEECHAT_RC_OK

    weechat.hook_process("say -v Xander -- '{}'".format(groups[0]), 0, "", "")
    return weechat.WEECHAT_RC_OK


weechat.hook_print("", "", "!xander", 1, "msg_cb", "")
