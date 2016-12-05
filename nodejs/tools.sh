#!/usr/bin/env bash

USER_HOME=/root

if [ ! -f "$USER_HOME/.profile" ]; then
    cp /backup/.profile $USER_HOME
fi

if [ ! -f "$USER_HOME/.bashrc" ]; then
    cp /backup/.bashrc $USER_HOME
fi

if [ ! -d "$USER_HOME/.nvm" ]; then
    export NVM_DIR="$USER_HOME/.nvm" && (
        git clone https://github.com/creationix/nvm.git "$NVM_DIR"
        cd "$NVM_DIR"
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
    ) && . "$NVM_DIR/nvm.sh"
fi

exec "$@"
