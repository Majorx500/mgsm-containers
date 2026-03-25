#!/bin/bash

# $1 -- gameversion $2 -- gamedir

base_dir=./

echo "$JAVA_ARGS"
if [[ -e "$MEMORY_SIZE" ]]; then
  JAVA_ARGS="$JAVA_ARGS -Xms$MEMORY_SIZE -Xmx$MEMORY_SIZE"
fi
if [[ -d $base_dir/serverfiles ]]; then
  cd serverfiles || exit
  java "$JAVA_ARGS" -jar papermc.jar -nogui
  game_url=$(curl -X 'GET' \
    "https://fill.papermc.io/v3/projects/paper/versions/$GAME_VERSION/builds/latest" \
    -H 'accept: application/json' | jq -r '.downloads."server:default".url')
  mkdir -p ./serverfiles

  wget "$game_url" -O "./serverfiles/papermc.jar" 1>/dev/null
  chmod +x ".//serverfiles/papermc.jar"

  echo "eula=true" >./serverfiles/eula.txt

  echo "Installing server"
  cd serverfiles || exit
  java -jar "$JAVA_ARGS" -nogui papermc.jar
fi
