#!/bin/sh

# if a volume has been mounted copy in the config file and symlink it
# so the config persists container restarts
if [ -d /etc/pfclient ]; then
    echo Found /etc/pfclient directory
    if [ -f /etc/pfclient/pfclient-config.json ]; then
        echo Removing default config
        rm /etc/pfclient-config.json
    else
        echo Copying default config to directory
        mv /etc/pfclient-config.json /etc/pfclient/
    fi
    ln -s /etc/pfclient/pfclient-config.json /etc/pfclient-config.json
fi

pfclient --config_path=/etc/pfclient-config.json
