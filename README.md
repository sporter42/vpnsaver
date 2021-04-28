# vpnsaver
A simple macOS utility to disconnect from AWS VPN (openvpn) when not in use

This script will disconnect you from your AWS VPN if your screen is locked and has been so for 60 minutes.

There are VPN configuration options to either disconnect if the connection utilization is low (for example, if less than 100 kilobytes is transferred in a 5 minute period) or a certain time after the connection is initiated (for example, disconnect after 12 hours). ([More info about those options](https://openvpn.net/vpn-server-resources/openvpn-tunnel-session-management-options/).) This is just a client-side script that works based on the screen being locked for a certain amount of time. Another tool in the toolbox, so to speak.

## Installation
Copy local.vpnsaver.plist to ~/Library/LaunchAgents/
```sh
$ cp local.vpnsaver.plist ~/Library/LaunchAgents/
```
Copy vpnsaver.sh to ~/Library/vpnsaver/ (you'll have to create this directory)
```sh
$ mkdir ~/Library/vpnsaver
$ cp vpnsaver.sh ~/Library/vpnsaver/
```
Add the LaunchAgent 
```
$ launchctl load ~/Library/LaunchAgents/local.vpnsaver.plist
```

## Dependencies/Assumptions
Assumes you're using the AWS VPN Client and it is installed in /Applications/AWS VPN Client/

## Configuration
There isn't much to configure. 

You can edit the LaunchAgent plist to change the interval at which the script is launched to check if disconnect is warranted (3 minutes is the default). (For such changes to take effect, one must then unload-and-load the LaunchAgent.)

You can edit the script to change the amount of lock time until the VPN is disconnected (60 minutes is the default). 
