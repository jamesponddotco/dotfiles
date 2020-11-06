import os

# Get information from pass(1) instead of hardcoding it, so we can commit this
# file to a git repository without worrying about it.
def get_pass(key):
    return os.popen("pass show {} | head -n 1".format(key)).read().strip()

# Phone number and encryption key for the database stay inside pass(1).
PHONE = get_pass("tg/phone-number")
ENC_KEY = get_pass("tg/encryption-key")

# Configure tg(1) to use notify-send(1) instead of terminal-notifier, since we
# are on Linux, not macOS.
NOTIFY_CMD = "/usr/bin/notify-send -a Telegram -i /usr/share/icons/Qogir/scalable/apps/telegram.svg {title} {msg}"

# Use nnn(1) to choose files when sending something.
FILE_PICKER_CMD = "nnn -p {file_path}"

# Tell tg(1) how it should open files from Telegram.
MAILCAP_FILE = os.path.expanduser("~/.config/mailcap")
