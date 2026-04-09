#!/bin/bash

# $1 -- gameversion $2 -- gamedir
base_dir=./
JAVA_ARGS="java"
if [[ -e "$MEMORY_SIZE" ]]; then

  JAVA_ARGS="$JAVA_ARGS -Xms$MEMORY_SIZE -Xmx$MEMORY_SIZE"
fi

if [[ ! -f $base_dir/papermc ]]; then

  wget "https://meta.fabricmc.net/v2/versions/loader/$GAME_VERSION/0.19.0/1.1.1/server/jar" -O "./fabricmc.jar" 1>/dev/null
  chmod +x "./fabricmc.jar"

  echo "eula=true" >./eula.txt
  echo "Installing server"

  echo "stop" | "$JAVA_ARGS" -jar fabricmc.jar -nogui
fi

if [[ ! $(id -u) -eq $UID ]]; then
  JAVA_ARGS="gosu mgsm:mgsm $JAVA_ARGS"
  chown -vR $UID:$GID /data
fi

exec $JAVA_ARGS -jar fabricmc.jar -nogui
