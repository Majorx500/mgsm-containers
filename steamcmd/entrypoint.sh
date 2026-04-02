#!/bin/bash

if [[ -f "steamcmd.sh" ]]; then
  echo "SteamCMD found, exiting"
  exit 0
fi

echo "Installing Steamcmd"

curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

chown mgsm:mgsm -R ./*

./steamcmd.sh +exit
