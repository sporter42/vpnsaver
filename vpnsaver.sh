#!/bin/sh
logoutAfterIdleMinutes=30
echo `date`

ps ax | grep -v grep | grep -q acvc-openvpn
if [ $? -ne 0 ]; then
    echo "Offline"
    exit
fi

echo "Online; Starting check"
function screenIsLocked { [ "$(/usr/libexec/PlistBuddy -c "print :IOConsoleUsers:0:CGSSessionScreenIsLocked" /dev/stdin 2>/dev/null <<< "$(ioreg -n Root -d1 -a)")" = "true" ] && return 0 || return 1; }
if (screenIsLocked); then

    echo "Screen is locked"

    lockedTime=$(/usr/libexec/PlistBuddy -c "print :IOConsoleUsers:0:CGSSessionScreenLockedTime" /dev/stdin 2>/dev/null <<< "$(ioreg -n Root -d1 -a)")
    currentTime=$(date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s")
    lockedDuration=$(expr $currentTime - $lockedTime)
    logoutAfterIdleSeconds=$(expr 60 \* $logoutAfterIdleMinutes)

    if [ $lockedDuration -gt $logoutAfterIdleSeconds ]; then
        echo "Shutting down VPN"
        /Applications/AWS\ VPN\ Client/AWS\ VPN\ Client.app/Contents/Resources/AWS\ VPN\ Client/Contents/MacOS/ACVCHelperTool --kill
    fi
    exit
fi

echo "No change"
