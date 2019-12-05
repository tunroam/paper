
### 802.1x credentials

We now look at the 802.1x credentials,
which will encode the VPN endpoint in the anonymous identity,
as described in section *[802.1x identity]*.
This will allow foreign APs to whitelist traffic to it.

```
client
   |
   a
```
![Supplicant sets network configuration (snippet from +@fig:asciiartsequence)](/pixel.png){#fig:asciiartscan}

<!--
The client can connect to a foreign AP when found during scanning for new networks,
as shown in step a in
-->
The clients needs to add a new Wi-Fi network
(+@fig:asciiartscan),
using the configuration shown in +@tbl:wificonf.

| field | value | default |
| --- | ------ | --- |
| SSID | "tunroam.org 19" | |
| Security | 802.1x EAP | |
| EAP type | Protected EAP (PEAP) | |
| phase 2 | MSCHAPv2 | |
| CA certificate | *variable* | no validation |
| anonymous identity | *variable*| |
| identity | *variable* | |
| password | *variable* | "password" |
Table: Network configuration on supplicant {#tbl:wificonf}

The *variable* fields in +@tbl:wificonf
are dependent on the
*[validate_certificate]* flag being set.
The static values are motivated in section *[Wireless configuration]*.


When the client connects to an AP (+@fig:asciiartinitconn),
the anonymous identity is used to communicate the VPN endpoint to the AP.

```
client  |hostapd
   |        |
   a        |
   #---b--->#
```
![Supplicant connects to AP (snippet from +@fig:asciiartsequence)](/pixel.png){#fig:asciiartinitconn}

Clients have the option to indicate that their 802.1x request
MUST be proxied to their
own server (to get a known certificate).

##### validate_certificate disabled

Without certificate validation,
the AP does not proxy the 802.1x request,
giving the supplicant a different certificate at every location.

Example:
When we describe the identities for an OpenVPN/WireGuard VPN server running on port 443 UDP
(IP protocol [0x11](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)),
it is encoded as `11443`
and has the flag character appended
(as described in section *[802.1x identity]*):

```
11443a@<ADDRESS-VPN-SERVER>
```

where `<ADDRESS-VPN-SERVER>` is an IP address or fully qualified domain name (FQDN).

The password field needs to have the literal value "password",
to allow the authentication server to complete the
Challenge-Handshake Authentication Protocol (*[CHAP]*) procedure.

##### validate_certificate enabled

If the supplicant desires to validate the certificate,
or has no option/rights to disable validation;
it needs different values for the identities and password fields.

In the following example of an anonymous identity,
the flag character (`b`) indicates the request needs to be proxied:
```
11443b@<FQDN-EAP-SERVER>
```

The regular identity is not exposed to the AP
but only seen by the server providing the certificate.
The realm part (`<FQDN-EAP-SERVER>`) MUST be the same
for both identities from +@tbl:wificonf
(as described in section *[Identities]*).
The user part of the identity and the password
MAY
be specified for the specific needs of the
external authentication server proxied to.

##### Multiple protocols and ports

To allow clients to use various *[VPN protocols]*,
one can define multiple protocols and ports.
These are separated by an underscore,
as seen in the following IPsec example:

```
11500_32_33_114500a@10.10.10.10
```
The corresponding values are explained in +@tbl:ipsec.

| value | IP proto. id | IP protocol name | port | description |
| --- | --- | --- | --- | --- |
| `11500` | `0x11` | User Datagram Protocol (UDP) | 500 | Internet Key Exchange (IKE) |
| `32` | `0x32` | Encap Security Payload (ESP) | N/A | |
| `33` | `0x33` | Authentication Header (AH) | N/A | |
| `114500` | `0x11` | User Datagram Protocol (UDP) | 4500 | NAT-T [(RFC 3947 sec. 4)](https://tools.ietf.org/html/rfc3947) |
Table: Protocols and ports for IPsec example {#tbl:ipsec}

<!--
where
`0x11 =` User Datagram Protocol (UDP),
`port 500 =` Internet Key Exchange (IKE),
`port 4500 = NAT-T`
[(RFC 3947 section 4)](https://tools.ietf.org/html/rfc3947),
`0x32 =` Encapsulating Security Payload (ESP)
and
`0x33 =` Authentication Header (AH).
-->


The AP MAY only allow traffic for the *[L4 Transport layer]* protocols it supports
and were found valid (i.e. listening).

