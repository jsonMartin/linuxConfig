#!/bin/sh

# Authored on 2020-02-19
# Requires msi-perkeyrgb as a dependency

if [ -z "$1" ] # Check if RGB value is provided
then

	echo "Must supply RGB value as first parameter"
	exit 1
else
	sudo msi-perkeyrgb -m gs65 -s "$1"
fi

