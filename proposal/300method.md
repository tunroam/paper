# Approach

We will design a protocol that creates a secure setup for both
the Wi-Fi AP (access point) and the client
by updating home routers.
This allows anyone to securely share their Wi-Fi with others.
We implement this by using a custom router (or separate AP),
creating a tunnel between
the mobile client and its home router (running a VPN server).

<!--
For anyone to use this free Wi-Fi service,
one needs to have their own VPN server
(preferably on another setup running the protocol).

The most economical way for most people will be to update their router,
adding another node to the network,
increasing the amount of free WiFi locations.
-->

## Setup overview

In the following diagram,
<!--
{#lst:clienttovpn}
-->
the supplicant could be a mobile client like a smartphone or laptop.

The AP allows the 802.1x client (supplicant) to connect
and only accepts VPN traffic and DNS requests used to discover the VPN server.
The AP is the authenticator and runs the authentication server.
The authentication information
will be used to identify the VPN server
and set the filter rules.


```{#lst:clienttovpn caption="Client uses foreign AP through VPN"}
   ______
  |802.1x|
  |client|
  | +VPN |
  |______|
     |
WiFi-|-[{DNS req. for VPN IP}, {VPN traffic}]
     |
   __V__
  |  AP |---> DNS requests
  |_____|
     |
 WAN-|-{VPN traffic}
     |
   __V___
  |VPN   |
  |server|
  |______|

```

The VPN server is part of another AP at a different location (home address of supplicant).
An AP has thus two public interfaces;

- VPN server on its public IP address
- WiFi AP


<!--
We define the Access Point (AP) as a home WiFi router including:

- public IPv4 address (IPv6 is future work)
- VPN server
- ability to share VPN certificate and credentials with client



We aim to create the setup as code,
to enable an additional AP to be created by running a script.
Enabling future participants to join at
[zero marginal cost](https://wiki.p2pfoundation.net/Zero_Marginal_Cost_Society).


-->




