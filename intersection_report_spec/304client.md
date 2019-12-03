## Protocol: Supplicant

We have seen the *[Protocol introduction]*,
which showed that the supplicant initiates the protocol.
We will now look at the configuration required on the supplicant (client).

The client needs to configure two aspects,
the 802.1x *[Wireless configuration]*
and a VPN client.
The *[Wireless configuration]* is part of this protocol
and is created with the following information:

- domain or IP of *[VPN server]*
- IP *[Protocols and ports]* used to connect to *[VPN server]*
- will the supplicant validate the 802.1x certificate?

This section details the configuration of the client.
The motivation for these settings can be found in section *[Protocol: AP Specification]*.
