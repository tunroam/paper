# Method: Network requirements

> TUN works with IP frames. TAP works with Ethernet frames.
[^tunkernel]

[^tunkernel]: https://www.kernel.org/doc/Documentation/networking/tuntap.txt

## Shared SSID

Like Eduroam / Govroam: TUNroam;

```

tunroam.org 19

```

- Version number indicates client requirements (20*19*)



# Method: Additional network traffic?

## Local scope

- Network management (e.g. ARP[^arp])

[^arp]: Address Resolution Protocol

## Leaking to Internet Service Provider (ISP)

- DNS

![VPN endpoint discovery by client](slides/endpointdiscovery.png)


# Method: DNS

AP provider doesn't want DNS logged by ISP

## Required: specific subdomain

```
iptables-nft -I OUTPUT -j ALLOW --algo bm \
  -p udp --dport 53 \
  --match string --hex-string "|07|tunroam|"
```

