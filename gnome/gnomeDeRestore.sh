#!/bin/bash

FILEPATH=$1

dconf load / < $FILEPATH

echo "Backup restored"
