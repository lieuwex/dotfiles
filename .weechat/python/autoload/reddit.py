import weechat
import re

name = "reddit"
author = "Lieuwe Rooijakkers <lieuwerooijakkers@gmail.com> (http://www.lieuwe.xyz/)"
version = "0.1"
license = "MIT"
description = "/r/kaas -> http://reddit.com/r/kaas"
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
reg = re.compile(r"(^|\s)/?r/([\d\w_-]+)", re.IGNORECASE)

def msg_cb(data, modifier, modifier_data, string):
    return reg.sub(r"\1http://reddit.com/r/\2", string)

weechat.hook_modifier("input_text_for_buffer", "msg_cb", "")
