#!/bin/bash

STEAMCMD_DIR="/steamcmd/steamcmd.sh"

if [ ! -d /data/serverfiles ]; then
  mkdir /data/serverfiles

  $STEAMCMD_DIR +force_install_dir /data/serverfiles/ +login anonymous +app_update $GAMEID validate +exit
fi

cd serverfiles || exit

./LocalAdmin 7777 yes keep this
