# coding: utf-8
#
# Copyright (c) 2015 by Lieuwe Rooijakkers <lieuwerooijakkers@gmail.com> (http://www.lieuwex.me/)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# 2015-06-01: Lieuwe Rooijakkers <lieuwerooijakkers@gmail.com> (http://www.lieuwex.me/)
#        0.1: initial release

try:
    import weechat as w
except Exception:
    print("This script must be run under WeeChat.")
    print("Get WeeChat now at: http://www.weechat.org/")
    quit()

import re

name = "block_words"
author = "Lieuwe Rooijakkers <lieuwerooijakkers@gmail.com> (http://www.lieuwex.me/)"
version = "0.1"
license = "GPLv3"
description = "Avoid sending various setup words (e.g. your password) as messages"
shutdown_function = ""
charset = ""

w.register(name, author, version, license, description, shutdown_function, charset)

settings = {
    'words': '', # comma seperated list of words which needs to be blocked.
    'case_sensitive': "off" # whether or not the word search should be case sensitive.
}

for opt, val in settings.iteritems():
    if not w.config_is_set_plugin(opt):
        w.config_set_plugin(opt, val)

def on_buffer_input(data, modifier, modifier_data, string):
    originalString = string

    if string.find("/") == 0: # We dont want to block commands from executing
        return originalString

    for word in words:
        word = word.lower() if not case_sensitive else word
        string = string.lower() if not case_sensitive else string

        if word in string:
            w.prnt_date_tags(w.current_buffer(), 0, 'no_log', '%sunwanted message deleted.' % (w.prefix('error')))
            return ''

    return originalString

options = {}
words = None
case_sensitive = None
def update_options():
    global options, words, case_sensitive

    options = {}

    for option in settings.keys():
        options[option] = w.config_get_plugin(option)

    words = [s.strip() for s in options["words"].split(",") if len(s) > 0]
    case_sensitive = True if options["case_sensitive"] == "on" else False

def on_option_change(data, option, value):
    update_options()

    return w.WEECHAT_RC_OK

for option in settings.keys():
    w.hook_config("plugins.var.python.%s.%s" % (name, option), "on_option_change", "")

w.hook_modifier('input_text_for_buffer', 'on_buffer_input', '')

update_options()
