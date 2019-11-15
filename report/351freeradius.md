### Configuring FreeRADIUS

We use FreeRADIUS, since it
"is the most popular and the most widely deployed RADIUS server"[^motivatefreerad].
While Diameter
([RFC3588](https://tools.ietf.org/html/rfc3588))
is a newer protocol,
RADIUS was chosen since it is a widely adopted protocol
in existing wireless infrastructures and routers.

[^motivatefreerad]: https://networkradius.com/doc/current/introduction/FreeRADIUS.html



We need three modifications on the authentication server:

- Allow our server to be reached from everywhere: for proxied requests
- Allow every user when doing the CHAP: one shared fixed password
- Install a pre-authorize script: verify identity and VPN endpoint

The first item was
described in section *[802.1x authentication server]*
and the other two can be found in section
*[ FreeRADIUS modifications]*.

#### Inner-tunnel

The RADIUS server needs to be able to proxy the RADIUS request
when the supplicant set the `validate_certificate` flag.
We mimic this external authentication server by configuring a second server:

```
$ ls /etc/freeradius/*/sites-enabled
default  inner-tunnel
```

Both these RADIUS servers run on the same SoC:

```
$ ss -4lpun|grep -E "(1812|Port)"
State  Recv-Q Send-Q Local Address:Port   Peer Address:Port
UNCONN 0      0            0.0.0.0:1812        0.0.0.0:*
UNCONN 0      0          127.0.0.1:18120       0.0.0.0:*
```

The PoC is not configured to be able to proxy to external RADIUS servers,
but the behavior is simulated by running two daemons.

