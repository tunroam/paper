# Appendix: bonus slides


Slides to help answer possible questions.

And things that didn't fit due to time constraints.

# Appendix: tests using fast.com

![Eduroam network Surfnet office](slides/speed_eduroam.png)

# Appendix: tests using fast.com

![OrangePi doing NAT](slides/speed_tunroam.png)


# Appendix: Covert channel? Abuse?

## Using VPN is easier due to:

- Limited DNS requests
- Only one IP address
- Limited ports


# Appendix: Bridge vs. NAT

## Bridge

- Sequence diagram = bridged (home setup)
- Avoid double NAT
- Avoid NAT in software

## Network Address Translation

- NAT works everywhere
- PoC/Demo = NAT

## Multiple APs (Campus / Airport)

- Authentication server separate
- Network policies


# Appendix: RADIUS proxying

```
$ ls /etc/freeradius/*/sites-enabled
default  inner-tunnel
```

```
$ ss -4lpun|grep -E "(1812|Port)"
State  Recv-Q Send-Q Local Address:Port   Peer Address:Port
UNCONN 0      0            0.0.0.0:1812        0.0.0.0:*
UNCONN 0      0          127.0.0.1:18120       0.0.0.0:*
```

- Inner does CHAP


# Appendix: Challenge-Handshake Authentication Protocol

Microsoft CHAP v2

## Authentication server: proxy-server

```python
if valid_vpn_endpoint and valid_anonid: # anonymous identity
```

## Authentication server: inner-tunnel

```python
  return RLM_MODULE_OK, (), \
    ( ('Cleartext-Password', 'password'), )
```

# Appendix: VPN protocols

### Initial

- Which VPN protocol(s) fit in the protocol?
- What attributes do we need to validate to determine if a VPN server is listening on an endpoint?

### Different approach

- Stealth VPN servers
- IP protocols
- Check socket
- Allow evolution


# Appendix: Flag character

| bit | name | description |
| --- | ------ | ------------ |
| 0000? | `validate_certificate` | Validate 802.1x certificate? |
| 000?0 | RESERVED | |
| 00?00 | RESERVED | |
| 0?000 | RESERVED | |
| ?0000 | RESERVED | |

- base32 character: [RFC4648](https://tools.ietf.org/html/rfc4648)

# Well-known ports

AP MAY filter well-known ports (below 1024)

- except:
  - 22 (socks tunnel),
  - 443 (HTTPS tunnel)
  - 500 (IKE[^ike] for IPsec)

[^ike]: Internet Key Exchange
