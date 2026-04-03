#!/bin/bash

STEAMCMD_DIR="/home/mgsm/steamcmd/steamcmd.sh"

if [ ! -f /data/LocalAdmin ]; then

  $STEAMCMD_DIR +force_install_dir /data +login anonymous +app_update $GAMEID validate +exit
fi

gosu mgsm:mgsm /data/LocalAdmin 7777 yes keep this
