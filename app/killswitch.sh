#!/bin/bash

if [ -n "${LOGFILE}" ]; then
  TIMESTAMP=`date "+%y%m%d-%H%M%S"`
  echo "${TIMESTAMP}: KILLSWITCH ACTIVATED" >> /out/${LOGFILE}
fi

if [ "${OVPNKS}" == "ACTIVE" ]; then
  pkill qbittorrent
fi
