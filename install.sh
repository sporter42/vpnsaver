#!/usr/bin/env bash    

PLIST=~/Library/LaunchAgents/local.vpnsaver.plist
LaunchAgents=~/Library/LaunchAgents/
DIR=~/Library/vpnsaver/

if [ -e $PLIST ]
then
	echo "Removing installed version so we can upgrade it"

	echo "Unload plist as a service"
	launchctl unload $PLIST

	echo "Remove plist from LaunchAgents"
	rm $PLIST

	echo "Remove Library/vpnsaver directory"
	rm -r $DIR
fi

echo "Copy local.vpnsaver.plist into LaunchAgents"
cp local.vpnsaver.plist $LaunchAgents

echo "Make Library/vpnsaver directory"
mkdir $DIR

echo "Copy vpnsaver.sh into the new directory"
cp vpnsaver.sh $DIR

echo "Load plist as a service"
launchctl load $PLIST
