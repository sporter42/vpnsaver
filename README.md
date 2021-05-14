# vpnsaver
This script will disconnect you from your AWS VPN if your screen is locked and has been so for 60 minutes.

There are server-side VPN configuration options to either disconnect if the connection utilization is low (for example, if less than 100 kilobytes is transferred in a 5 minute period) or a certain time after the connection is initiated (for example, after 12 hours). ([More info about those options](https://openvpn.net/vpn-server-resources/openvpn-tunnel-session-management-options/).) 

vpnsaver is a client-side script that works based on the screen being locked for a certain amount of time. Another tool in the toolbox, so to speak. (AWS Client VPN costs $0.05/hour/connection, so if you would otherwise always forget to disconnect when done and you use the connection 60 hours/week, it saves about $20/month.)

## Installation
Open a terminal window and cd to this directory

Run the install.sh file
```sh install.sh
```

## Dependencies/Assumptions
Assumes you're using the AWS VPN Client and it is installed in /Applications/AWS VPN Client/

## Configuration
There isn't much to configure. 

You can edit the LaunchAgent plist to change the interval at which the script is launched to check if disconnect is warranted (3 minutes is the default). (For such changes to take effect, one must then unload-and-load the LaunchAgent.)

You can edit the script to change the amount of lock time until the VPN is disconnected (60 minutes is the default). 
