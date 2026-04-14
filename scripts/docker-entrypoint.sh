#!/bin/sh
set -e

PUID=${USER_UID:-1000}
PGID=${USER_GID:-1000}

if [ "$(id -u node)" -ne "$PUID" ]; then
    usermod -o -u "$PUID" node
fi

if [ "$(id -g node)" -ne "$PGID" ]; then
    groupmod -o -g "$PGID" node
    usermod -g "$PGID" node
fi

# Always fix volume ownership (Railway mounts volumes as root)
chown -R node:node /paperclip

exec gosu node "$@"
