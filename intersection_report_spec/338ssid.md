### Wireless configuration

```
client  |hostapd
   |        |
   #---b--->#
```

The service set identifier (SSID)
MUST
be
"tunroam.org 19".

Clients
MUST
be able to connect using PEAP with MSCHAPv2
as discussed in section *[EAP protocols]*.


#### Motivation

Versioning is possible with different SSIDs.
The number in the required SSID
refers to the 2019 version of the protocol.

If new versions of the protocol would
require the client to provide different information,
the version number
SHOULD
be set to the year the new version is released.
Clients
MAY
configure settings for multiple SSIDs,
which then can connect to the version available.

We observed that public Wi-Fi hotspots often include
the words "free" and "wifi".
We did not pick the words "Open"
(referring to Open Source, open to anyone to join the protocol)
since it could be misunderstand as an open wireless network.
We did not use "Free" since it requires the client to initially setup a VPN endpoint
and users have other expectations of "free wifi",
"wifi" in a Wi-Fi SSID is a pleonasm.

While the name Tunroam
has resemblance to Eduroam and Govroam,
this project is not associated with their brand or product.
Roam stands for roaming, allowing clients to connect in multiple locations.
Tun refers to VPN **tun**nel and
["tun"](https://github.com/torvalds/linux/blob/master/Documentation/networking/tuntap.txt#L214)
in:

> What is the difference between TUN driver and TAP driver?
> TUN works with IP frames. TAP works with Ethernet frames.
[^tunkernel]

[^tunkernel]: https://www.kernel.org/doc/Documentation/networking/tuntap.txt

