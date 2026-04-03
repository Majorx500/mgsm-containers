#!/bin/bash

if [[ -f "steamcmd.sh" ]]; then
  echo "SteamCMD found"
  ./steamcmd.sh +exit
  exit 0
fi
chown mgsm:mgsm -R ./*
./steamcmd.sh +exit
