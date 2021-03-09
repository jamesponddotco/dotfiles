# Personal settings for qutebrowser.

# Turn on scaling for my 4K display.
c.qt.highdpi = True

# Disable window decoration, which i3 does not use anyway.
c.window.hide_decoration = True

# Save my browser session by default.
c.auto_save.session = True

# Open new tabs in the background.
c.tabs.background = True

# Define the homepage.
config.set('url.start_pages', 'https://feedbin.com/')

# Custom key bindings.
config.bind("xjt", "set content.javascript.enabled true")
config.bind("xjf", "set content.javascript.enabled false")

# Aliases to open YouTube links with MPV.
c.aliases = {
    "mpv": "spawn -d mpv --fs {url}",
    "mpv-pip": "spawn -d mpv --ontop --no-border --on-all-workspaces --autofit=1280x720 --geometry=98%:98% {url}"
}

# Use the same user-agent as Firefox on Linux.
config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36')

# Disable WebGL by default.
config.set('content.webgl', False)

# Sites should not be allowed to send notifications.
config.set('content.notifications', False)

# Sites cannot ask for my location.
config.set('content.geolocation', False)

# Content should not autoplay by default.
config.set('content.autoplay', False)

# Do not accept third-party cookies.
config.set('content.cookies.accept', 'no-3rdparty')

# Disable Javascript by default.
config.set('content.javascript.enabled', False)

# Enable Javascript for selected websites.
js_whitelist = [
    "*://localhost/*",
    "*://127.0.0.1/*",
    "https://news.ycombinator.com/*",
    "https://feedbin.com/*",
    "https://languagetool.org/*",
    "https://my.1password.com/*",
    "https://*.seedbox.io/*",
    "https://*.floatplane.com/*",
    "https://*.hetzner.com/*",
    "https://console.hetzner.cloud/*",
    "https://robot.your-server.de/*",
    "https://www.justwatch.com/*"
    "https://id.gandi.net/*"
    "https://admin.gandi.net/*"
]

for site in js_whitelist:
    with config.pattern(site) as p:
        p.content.javascript.enabled = True

# Disable the loading of settings set via the GUI.
config.load_autoconfig(False)

# Use the Nord colorscheme to match my desktop. Source is over here[1], with a
# few modifications here, and there.
#
# [1] https://github.com/Linuus/nord-qutebrowser
config.source('themes/nord.py')
