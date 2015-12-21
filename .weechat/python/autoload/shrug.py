# Modified by Lieuwe Rooijakkers
# Original from https://github.com/cmurphy/weechat-shrug

# Copyright 2015 Colleen Murphy
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import weechat
import os.path

def writeNumberToFile(filename, num):
    with open(filename, 'w+') as f:
        f.write(str(num))

name = "shrug"
author = "Lieuwe Rooijakkers <lieuwerooijakkers@gmail.com> (http://www.lieuwex.me/)"
version = "0.0.2"
license = "Apache-2.0"
description = "shrug"
weechat.register(name, author, version, license, description, "", "")

counterLocation = "%s/.countercount" % os.environ['HOME']
count = 0

if os.path.isfile(counterLocation):
    with open(counterLocation, 'r') as f:
        count = int(f.readline())

def shrug(data, buffer, args):
    global count
    weechat.command(buffer, u"\u00af\_(\u30c4)_/\u00af".encode('utf-8'))

    count += 1
    writeNumberToFile(counterLocation, count)

    return weechat.WEECHAT_RC_OK

def showcount(data, buffer, args):
    weechat.command(buffer, "I've shrugged %g times!" % count)
    return weechat.WEECHAT_RC_OK

weechat.hook_command("shrug", "Shrug", "", "", "", "shrug", weechat.current_buffer())
weechat.hook_command("count", "Show the amount of shrugs you did", "", "", "", "showcount", weechat.current_buffer())
