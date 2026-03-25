#!/bin/bash

# $1 -- gameversion $2 -- gamedir
base_dir=./
JAVA_ARGS="java"
if [[ -e "$MEMORY_SIZE" ]]; then

  JAVA_ARGS="$JAVA_ARGS -Xms$MEMORY_SIZE -Xmx$MEMORY_SIZE"
fi

if [[ ! -d $base_dir/serverfiles ]]; then
  game_url=$(curl -X 'GET' \
    "https://fill.papermc.io/v3/projects/paper/versions/$GAME_VERSION/builds/latest" \
    -H 'accept: application/json' | jq -r '.downloads."server:default".url')

  wget "$game_url" -O "./papermc.jar" 1>/dev/null
  chmod +x "./papermc.jar"

  echo "eula=true" >./eula.txt
  echo "Installing server"

  echo "stop" | "$JAVA_ARGS" -jar papermc.jar -nogui
fi

if [[ ! $(id -u) -eq $UID ]]; then
  JAVA_ARGS="gosu mgsm:mgsm $JAVA_ARGS"
  chown -vR $UID:$GID /data
fi

exec $JAVA_ARGS -jar papermc.jar -nogui
