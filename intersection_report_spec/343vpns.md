### VPN server

```
client  |hostapd  auth   pre  filter| |DHCP   WAN|   VPN
   |        |      |      |      |      |      |      |
   #---m-------------------------=------------------->#
```

The VPN client will run on the mobile client,
not the AP.
Otherwise the AP could do malicious activities using the IP address of the VPN server.

The AP
SHOULD
have a VPN server installed,
enabling the operator of this AP to connect to foreign APs
using this VPN server.
This creates decentralized peer to peer tunnels.


