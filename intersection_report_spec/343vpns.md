### VPN server

The AP SHOULD
have a VPN server installed,
enabling the operator of this AP to connect to foreign APs
using this VPN server,
as shown in +@fig:asciiartclientconnvpn.
This creates decentralized peer to peer tunnels
between clients and their own AP (being the VPN server).


```
client  |hostapd  auth   pre  filter| |DHCP   WAN|   VPN
   |        |      |      |      |      |      |      |
   #---m-------------------------=------------------->#
```
![Client connects to VPN (snippet from +@fig:asciiartsequence)](/pixel.png){#fig:asciiartclientconnvpn}

The VPN client will run on the mobile client,
not the AP.
Otherwise the AP could do malicious activities using the IP address of the VPN server.

