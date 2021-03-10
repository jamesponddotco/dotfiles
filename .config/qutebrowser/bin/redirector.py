# Modified version of this Python script:
# https://gitlab.com/jgkamat/dotfiles/-/blob/master/qutebrowser/.config/qutebrowser/pyconfig/redirectors.py

import operator, re, typing
from urllib.parse import urljoin

from qutebrowser.api import interceptor, message
from PyQt5.QtCore import QUrl

REDIRECT_MAP = {
	"reddit.com": operator.methodcaller('setHost', 'libredd.it'),
	"www.reddit.com": operator.methodcaller('setHost', 'libredd.it'),
	"twitter.com": operator.methodcaller('setHost', 'nitter.nixnet.services'),
	"www.twitter.com": operator.methodcaller('setHost', 'nitter.nixnet.services'),
	"youtube.com": operator.methodcaller('setHost', 'yewtu.be'),
	"www.youtube.com": operator.methodcaller('setHost', 'yewtu.be'),
}

def int_fn(info: interceptor.Request):
	"""Block the given request if necessary."""
	if (info.resource_type != interceptor.ResourceType.main_frame or
			info.request_url.scheme() in {"data", "blob"}):
		return
	url = info.request_url
	redir = REDIRECT_MAP.get(url.host())
	if redir is not None and redir(url) is not False:
		message.info("Redirecting to " + url.toString())
		info.redirect(url)

interceptor.register(int_fn)
