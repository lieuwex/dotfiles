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
# 2015-05-31: Lieuwe Rooijakkers <lieuwerooijakkers@gmail.com> (http://www.lieuwex.me/)
#        0.1: initial release

try:
    import weechat as w
except Exception:
    print("This script must be run under WeeChat.")
    print("Get WeeChat now at: http://www.weechat.org/")
    quit()

import re

name = "metarip_preventer"
author = "Lieuwe Rooijakkers <lieuwerooijakkers@gmail.com> (http://www.lieuwex.me/)"
version = "0.1"
license = "GPLv3"
description = "Prevents some meta-rips."
shutdown_function = ""
charset = ""

w.register(name, author, version, license, description, shutdown_function, charset)

metarips = ["ri\np", "riop", "irp", "rpi", "rio", "ri[", "rip[", "ripp", "rop"]
originalrip = None
currentrip = None
ripmessage = None


def on_buffer_input(data, modifier, modifier_data, message):
    global currentrip, ripmessage, originalrip

    def fixrip(wrongrip, msg=message):
        return re.sub(r"\b%s\b" % wrongrip, "rip", msg)

    if message.find("/") == 0:  # Leave commands alone.
        return message

    if currentrip is not None:
        if '\n' in currentrip:
            splitted = [s.strip() for s in currentrip.split('\n') if len(s) > 0]
            if len(splitted) > 0:
                currentrip = '\n'.join(splitted[1:])
                return ''

        elif currentrip == message:
            res = fixrip(originalrip, ripmessage)

            originalrip = None
            ripmessage = None
            currentrip = None

            return res

        else:
            res = '\n'.join([ripmessage, message])

            originalrip = None
            ripmessage = None
            currentrip = None

            return res

    for word in metarips:
        if '\n' in word:
            splitted = [s.strip() for s in word.split('\n') if len(s) > 0]
            if len(splitted) > 0 and message.split(' ')[-1] == splitted[0]:
                ripmessage = message
                originalrip = splitted[0]
                currentrip = '\n'.join(splitted[1:])

                return ''

        if word in message:
            return fixrip(word)

    return message


w.hook_modifier('input_text_for_buffer', 'on_buffer_input', '')
