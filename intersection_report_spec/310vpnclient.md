### VPN

```
client  |hostapd  auth   pre  filter| |DHCP   WAN|   VPN
   |        |      |      |      |      |      |      |
   #---k-------------------------=----->#      |      |
   #<--------------------------------l--#      |      |
   #---m-------------------------=------------------->#
```

The client
MAY
use the DNS server provided by the DHCP server of an AP.

The client
SHOULD
use a VPN client that connects to the VPN server using UDP
(e.g. OpenVPN, WireGuard or IPsec using NAT traversal
as defined in
[RFC3947 section 4](https://tools.ietf.org/html/rfc3947)).
VPN clients that use other protocols
MAY
be supported by the AP.

<!--
TODO
the following needs more explanation, since this is too technical
-->
A rogue AP could
accept a client and
use the VPN endpoint information to only block the VPN,
hoping the client will ignore the VPN.
Therefore the client
SHOULD
only allow traffic via the VPN when connecting to APs.

