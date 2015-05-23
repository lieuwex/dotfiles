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

name = "bitlbee_fixer"
author = "Lieuwe Rooijakkers <lieuwerooijakkers@gmail.com> (http://www.lieuwex.me/)"
version = "0.1"
license = "GPLv3"
description = "How did you get this fucking plugin, this should be as secret. D:"
shutdown_function = ""
charset = ""

w.register(name, author, version, license, description, shutdown_function, charset)

def on_buffer_text(data, modifier, modifier_data, string):
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

w.hook_modifier('input_text_for_buffer', 'on_buffer_text', '')

update_options()
