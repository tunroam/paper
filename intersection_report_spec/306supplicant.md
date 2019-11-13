
### 802.1x credentials

The device needs to add a new Wi-Fi network,
using the following configuration:

| field | value |
| --- | ------------ |
| SSID | "tunroam.org 19" |
| Security | 802.1x EAP |
| EAP type | Protected EAP (PEAP) |
| phase 2 | MSCHAPv2 |
| CA certificate | up to user, default = no validation |
| anonymous *identity* | see below |
| *identity* | see below |
| password | see below |

#### validate_certificate = false

Without certificate validation,
the AP does not proxy the 802.1x request,
giving the supplicant a different certificate at every location.

Example:
When we describe the *identities* for an OpenVPN/Wireguard VPN server running on port 443 UDP
(IP protocol [0x11](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)),
it is encoded as `11443`
and has the flag character appended (as described in the specification):

```
11443a@<ADDRESS-VPN-SERVER>
```

where `<ADDRESS-VPN-SERVER>` is an IP address or fully qualified domain name (FQDN).

The password field needs to have the value "password",
to allow the authentication server to complete the
Challenge-Handshake Authentication Protocol (CHAP) procedure.

#### validate_certificate = true

If the supplicant desires to validate the certificate,
or has no option/rights to disable validation;
it needs different values for the identities and password fields.

Anonymous identity example:
```
11443b@<FQDN-EAP-SERVER>
```

The *identity* is not exposed to the AP.
The realm part (`<FQDN-EAP-SERVER>`) MUST be the same
for both identities
(as described in the specification).
The user part of the identity and the password
MAY
be specified for the specific needs of the
external authentication server proxied to.

#### Multiple protocols and ports

One can define multiple protocols and ports by separating them with an underscore,
as seen in the following IPsec example:

```
11500_32_33_114500a@10.10.10.10
```

where
`0x11 =` User Datagram Protocol (UDP),
`port 500 =` Internet Key Exchange (IKE),
`port 4500 = NAT-T`
[(RFC 3947 section 4)](https://tools.ietf.org/html/rfc3947),
`0x32 =` Encapsulating Security Payload (ESP)
and
`0x33 =` Authentication Header (AH).


The AP
MAY
only allow traffic for the protocols it supports
and were found valid (i.e. listening).

