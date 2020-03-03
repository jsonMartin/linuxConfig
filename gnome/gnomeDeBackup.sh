#!/bin/bash

TIMESTAMP=$(date +%s)
FILEPATH="$HOME/linuxConfig/backups/gnome-de/$TIMESTAMP.dconf" # Absolute path

# dconf load / < $FILEPATH
dconf dump / > $FILEPATH

echo "Backup completed"
cat $FILEPATH
