#!/bin/sh -e

trap exit HUP
trap exit INT
trap exit TERM
trap exit QUIT
trap exit ABRT

# Copy eula to minecraft directory so this works
if [ ! -f /minecraft/eula.txt ]; then
  echo "Copying minecraft defaults into the proper location..."
  echo "eula=true" > /minecraft/eula.txt
  cp /minecraft-build/spigot*.jar /minecraft/spigot.jar && \
  cp --recursive --no-clobber /minecraft-build/defaults/* /minecraft
  chown -R minecraft.minecraft /minecraft/
fi

java -Xms$MEMORY_MIN -Xmx$MEMORY_MAX -jar spigot.jar
