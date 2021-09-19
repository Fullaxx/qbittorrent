#!/bin/bash

mkdir -p /data/dl
mkdir -p /data/autoload
mkdir -p /data/logs
mkdir -p ${HOME}/.config/qBittorrent

# if we have a new QBitTorrent config file (/config/qBittorrent.conf) use it
if [ -r /config/qBittorrent.conf ]; then
  cp /config/qBittorrent.conf ${HOME}/.config/qBittorrent/
fi

# if we have no config, use the default
if [ ! -r ${HOME}/.config/qBittorrent/qBittorrent.conf ]; then
  cp /usr/share/qBittorrent/qBittorrent.conf.default ${HOME}/.config/qBittorrent/qBittorrent.conf
fi

if [ -n "${USER}" ]; then
  chown -R ${USER}.${GROUP} ${HOME} /data
fi
