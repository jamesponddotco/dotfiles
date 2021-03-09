# Personal settings for qutebrowser.

# Disable the loading of settings set via the GUI.
config.load_autoconfig(False)

# Turn on display scaling since I scale my desktop to 200%.
config.set('qt.highdpi', True)

# Disable window decoration.
config.set('window.hide_decoration', True)

# Define the homepage.
config.set('url.start_pages', 'https://feedbin.com/')

# Custom key bindings.
config.bind('xjt', 'set content.javascript.enabled true')
config.bind('xjf', 'set content.javascript.enabled false')

# Aliases to open YouTube links with MPV.
c.aliases = {
    "mpv": "spawn -d mpv --fs {url}",
    "mpv-pip": "spawn -d mpv --ontop --no-border --on-all-workspaces --autofit=1280x720 --geometry=98%:98% {url}"
}

# Send more generic headers by default.
config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36')
config.set('content.headers.accept_language', 'en-US,en;q=0.9')
config.set('content.headers.do_not_track', False)
config.set('content.headers.referer', 'never')

# Enable the built-in adblocker based on Brave’s Rust library.
config.set('content.blocking.method', 'adblock')
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
    "https://easylist.to/easylist/fanboy-social.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt",
    "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt",
    "https://raw.githubusercontent.com/Spam404/lists/master/adblock-list.txt",
    "https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_2_English/filter.txt",
    "https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_3_Spyware/filter.txt",
    "https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_4_Social/filter.txt",
    "https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_9_Spanish/filter.txt",
    "https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_14_Annoyances/filter.txt",
    "https://raw.githubusercontent.com/ryanbr/fanboy-adblock/master/fanboy-antifacebook.txt",
    "https://raw.githubusercontent.com/ryanbr/fanboy-adblock/master/fanboy-antimessaging.txt",
    "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"
]

# Disable WebGL by default.
config.set('content.webgl', False)

# By default, do not allow websites to read canvas elements.
config.set('content.canvas_reading', False)

# Sites should not be allowed to send notifications.
config.set('content.notifications', False)

# Sites cannot ask for my location.
config.set('content.geolocation', False)

# Content should not autoplay by default.
config.set('content.autoplay', False)

# Do not accept third-party cookies.
config.set('content.cookies.accept', 'no-3rdparty')

# I do not use WebRTC, but there is no way to disable it as far as I know, so
# we try to limit it to public interfaces only here.
config.set('content.webrtc_ip_handling_policy', 'disable-non-proxied-udp')

# Disable DNS pre-fetch by default.
config.set('content.dns_prefetch', False)

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

# Do not show favicons, as I have no need for them.
config.set('tabs.favicons.show', 'never')

# Use the Nord colorscheme to match my desktop. Source is over here[1], with a
# few modifications here and there.
#
# [1] https://github.com/Linuus/nord-qutebrowser
config.source('themes/nord.py')
