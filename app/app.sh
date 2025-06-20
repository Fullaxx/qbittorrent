#!/bin/bash

bail()
{
  echo "$1"
  exit 1
}

source /app/imagestart.sh

/app/qbtcheck.sh

if [ -n "${GATEWAY}" ]; then
  /app/set_gateway.sh ${GATEWAY}
fi

if [ x"${OVPNCFG}" != "x" ]; then
  /app/openvpn.sh || bail "openvpn startup failed!"
  if [ x"${OVPNKS}" != "x" ]; then
    /app/monitor.sh &
  fi
fi

source /app/tiger.sh
