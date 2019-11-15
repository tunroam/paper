### 802.1x identity

First we clarify that the 802.1x identity is separate from the VPN credentials.
The 802.1x identity only states the VPN endpoint, not the user login for the VPN.

There are two identities/usernames, an anonymous (provided to the authentication proxy)
and the identity provided to the authentication server that provides the certificate.
We call the anonymous identity the `anonid` and the regular identity the `innerid`.
The `anonid` is handled at the AP and thus needs the VPN information.

A practical example of parsing the `anonid` is given in section
*[Pseudo code parse identity]*.

#### Identities

Identities consist of a user part and a realm/domain part,
separated by the `@` delimiter (i.e. `userpart@realmpart`).
The `anonid`
MUST
contain the same realm as the `innerid`
since Windows copies the realm part of the `innerid` and uses it in the `anonid`
[@win7eapid].


#### Flags

The last character of the user part
is a base32 character as defined by
[RFC4648](https://tools.ietf.org/html/rfc4648),
to represent 5 bits.
We have defined only the first (least significant bit) for this flag character;
the `validate_certificate` flag.
The flag character is an `a` if the supplicant does not validate
the 802.1x authentication certificate (default) or a `b` when the supplicant does
want to validate the certificate.
When the supplicant does desire to validate the certificate,
the AP
MUST
proxy the request.

| bit | name | description |
| --- | ------ | ------------ |
| 0000? | `validate_certificate` | Validate 802.1x certificate? |
| 000?0 | RESERVED | |
| 00?00 | RESERVED | |
| 0?000 | RESERVED | |
| ?0000 | RESERVED | |


##### Motivation

We place the flag before the default delimiter (`@`),
to enable it to be included in the delimiter, becoming a custom delimiter (`f@`).
It is prefixed and not appended
to require no parsing of the realm part when using the default delimiter.

We note that the
[realm module](https://github.com/FreeRADIUS/freeradius-server/blob/v3.0.x/raddb/mods-available/realm)
of FreeRADIUS
requires a single character as delimiter.

We pick base32 for the flag notation from the RFC instead of base64
to make the identity case insensitive.

#### Protocols and ports

The IP protocols are shown in section *[L4 Transport layer]*.

The supplicant communicates the IP protocols to the authentication
server by the IP protocol id in hexadecimal.
Additional information (i.e. port number) is appended to the id.
If multiple are given, they are separated by an underscore.

An example for port 443 TCP (0x06) and UDP (0x11):

```
06443_11443f@10.10.10.10
```

The AP
MUST
accept at least the first 3 tuples it supports.
If the AP only allows UDP (0x11),
it should be able to retrieve the UDP configuration
if unsupported protocols are preceding in the identity
(e.g. `32_33_2f_06443_11443a@10.10.10.10`).
The AP
SHOULD
accept the supplicant when
&mdash; of the supported protocols &mdash;
a subset of the ports were found valid
(e.g. when `0622` and `11443` are in the identity and no UDP 443 socket is detected, only TCP 22, it
MUST whitelist TCP 22 and accept the 802.1x request).


The AP MUST accept/reject supplicants based on
the information provided in the identity.
It MUST NOT
present a captive portal.

##### Motivation

While WireGuard and OpenVPN are protocols that only need one UDP port,
<!--
https://www.acevpn.com/knowledge-base/which-ports-to-unblock-for-vpn-traffic-to-passthrough/
-->
IPsec requires more ports.
Therefore we require at least 3 tuples to be processed.
More on VPN protocols can be found in section
*[VPN protocols]*.

The supplicant
MUST be accepted when only a subset is found valid,
to allow configurations such as
`32_33_11500_114500` (IPsec).

#### Hostname

If the realm part of the identity contains a FQDN instead of an IP address,
it
MUST
contain "`tunroam.`".
This subdomain requirement
MUST
be enforced in the authentication server
when validating the identity
and
MAY
also be enforced with DNS.
The authentication request
MUST
be rejected if this requirement is not met.

All IPv4 addresses
MUST
be in the dotted-decimal notation
([RFC1123](https://tools.ietf.org/html/rfc1123)).
IPv6 addresses
MUST
be in the format specified in
[RFC5952](https://tools.ietf.org/html/rfc5952),
without square brackets (used in URLs).

IPv4
MUST
be supported by the AP.
IPv6
SHOULD
be supported by the AP.

##### Motivation

Section *[Wireless configuration]* motivates the name of the protocol.
We use this name (TUNroam) as the required subdomain.

This subdomain MUST be enforced using the `anonid`
since APs MAY allow encrypted DNS,
resulting in this requirement not being verified when just using DNS filtering.
This requirement is set to avoid inconsistencies across APs,
where some do want to filter *[DNS]* and others do not.


The VPN client
MAY
require a DNS query to resolve the VPN endpoint.
To allow APs to filter these requests we require the realm part
of the 802.1x identity to include a specific subdomain.
This requirement is to protect the AP provider from unintended DNS queries
being logged by its ISP.

Mobile devices can contain apps that indicate a lifestyle
(e.g. Grindr; gay dating app)
that is celebrated (with parades) in some countries
and can lead to the death penalty in others
[@amnestypenalty].
<!--
not sure if we should mention this example
-->
When a client's VPN is off,
such apps could do DNS queries,
which can be blocked since they do not include the specific subdomain.

Pseudo filter rule:

```
iptables-nft -I OUTPUT -j ALLOW --algo bm \
  -p udp --dport 53 \
  --match string --hex-string "|07|tunroam|"
```
<!--
https://linuxsecurity101.com/2018/11/18/tips-and-tricks-blocking-dns-requests-via-iptables/
https://unix.stackexchange.com/questions/137904/how-to-do-domain-filtering-in-linux
-->



