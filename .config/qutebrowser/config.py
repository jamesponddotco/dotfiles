# Personal settings for qutebrowser.

# Turn on scaling for my 4K display.
c.qt.highdpi = True

# Disable window decoration, which i3 does not use anyway.
c.window.hide_decoration = True

# Save my browser session by default.
c.auto_save.session = True

# Open new tabs in the background.
c.tabs.background = True

# Custom key bindings.
config.bind("q", 'tab-close')
config.bind("xjn", "set content.javascript.enabled true")
config.bind("xjf", "set content.javascript.enabled false")

# Use the same user-agent as Firefox on Linux.
config.set('content.headers.user_agent', 'Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0')

# Disable WebGL by default.
config.set('content.webgl', False)

# Do not accept third-party cookies.
config.set('content.cookies.accept', 'no-3rdparty')

# Disable Javascript by default.
config.set('content.javascript.enabled', False)

# Enable Javascript for selected websites.
js_whitelist = [
    "*://localhost/*",
    "*://127.0.0.1/*",
    "https://github.com/*",
    "https://news.ycombinator.com/*",
    "https://feedbin.com/*",
    "https://languagetool.org/*",
    "https://mail.soverin.net/*",
    "https://my.1password.com/*",
    "https://*seedbox.io/*",
    "https://*floatplane.com/*"
]

# Use the Nord colorscheme to match my desktop. Source is over here[1], with a
# few modifications here, and there.
#
# [1] https://github.com/Linuus/nord-qutebrowser
config.source('themes/nord.py')
