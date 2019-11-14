## Future work

This section discusses some potential future work,
topics that may enrich or strengthen the protocol
or implementations of it.

<!--
Since the 802.1x supplicant is configured with the information of the VPN
(when no certificate validation is done),
one can generate the PEAP username from an `.ovpn` file.


### Proxy RADIUS request

We did not test the proxying of RADIUS requests

Functional 802.1x authentication server to authenticate clients at their home location



https://github.com/FreeRADIUS/freeradius-server/blob/v3.0.x/raddb/proxy.conf
https://github.com/redBorder/freeradius/blob/master/raddb/proxy.conf
https://wiki.freeradius.org/config/Proxy
https://wiki.freeradius.org/guide/request_flow.svg
https://wiki.freeradius.org/guide/Concepts

https://mrncciew.files.wordpress.com/2014/08/eap-peap-20.png
http://4.bp.blogspot.com/_F0xKISdTaPM/TJDrbWjEHJI/AAAAAAAACBI/LSjjvgCMIts/s1600/PEAP_preview.JPG
https://security.stackexchange.com/questions/154087/wpa2-with-802-1x-how-is-the-server-certificate-validated
https://gsec.hitb.org/materials/sg2018/D1%20COMMSEC%20-%20WiFi,%20Phishing%20and%20Red%20Teaming%20-%20Matteo%20Beccaro.pdf

Realms in FreeRADIUS
refer to the definitions in
[`proxy.conf`](https://github.com/FreeRADIUS/freeradius-server/blob/v3.0.x/raddb/proxy.conf).

-->



#### Dynamic DNS

When the VPN endpoint or the RADIUS server for `validate_certificate`
points to a home location without a fixed IP address,
the server should be able to update its DNS records when the IP address changes.
Besides DNS,
other options exists such as *dynamic IPSec* or
Tunnel Endpoint Discovery (TED).
Future research could explore ways to implement this.


#### RADIUS as a Service

If an external party offers to facilitate to serve as
a RADIUS server implementing this protocol;
what would be the (trust/security/privacy) implications?
This would allow an existing wireless infrastructure
to use this external
RADIUS server and would receive access control list (ACL) rules in return
(if no rules, client is Rejected).
The RADIUS server will receive data on connecting clients.

<!--
#### Convert channel

We expect that setting up a covert channel via an AP that implements
this protocol is infeasible,
since abiding by the requirement to use a VPN is the easiest way to use
the AP.
Further research could explore this into depth.
-->

<!--
#### Wildcard DNS

The protocol currently enables it to be used with VPN providers that provide a wildcard
for their VPN endpoint
(e.g. `*.vpnprovider.tld` makes `tunroam.vpnprovider.tld` possible),
since it has no requirements on DNS records and also allows users to use an IP address.
This can be mitigated by validating DNSSEC NSEC
([RFC3845](https://tools.ietf.org/html/rfc3845)).
What are the implications and or benefits of this?
-->

#### Malicious usage without VPN

The current protocol recommends IP protocol and port number filtering.
An attacker could use the identity to point to an DoH DNS resolver
(e.g. `06443_11443a@[8.8.8.8|1.1.1.1]`) and use that to resolve a website.
When the IP address of the website is know,
the attacker
disconnects and reconnects,
with the IP address of the website set in the `anonid` realm.
This allows the attacker to visit the website
(e.g. by modifying `/etc/hosts`)
without VPN,
leaking the server name indication (SNI) to the ISP of the AP provider.

Future research could look into (deep) packet inspection (DPI)
or other ways to avoid this potential abuse case.


#### DNS log poisoning

When the AP provider is the target,
an attacker could use
`tunroam.illegalcontent.tld`
in the realm part of the identity,
resulting in the DNS query being observed by the AP's ISP.
Future research could explore ways to mitigated this attack.

#### Automatic VPN client

Some devices
[can be configured](https://www.reddit.com/r/tasker/comments/2aml7b/howtoquestion_start_openvpn_connect_profile_when/)
to automatically enable a VPN
for specific network configurations.
Future research could explore ways to dynamically enable
VPN on clients for specific SSIDs.

#### 802.11u

For this research we used a shared SSID,
just like Eduroam does.
It might be possible to propose a new
'Access Network Type' to the 802.11u specification
or use the 'Venue Name information' field.

Another option is to use the
'Network Authentication Type' field to redirect to a local server
and have the required configuration stored in localStorage in the browser.

Future research could explore options to avoid the requirement of a shared SSID,
allowing companies to broadcast their own name as SSID while supporting
the protocol.

#### Additional

- Bandwidth management
- Quality of Service (QoS)
- Interoperability between [IPv6 and IPv4](https://en.wikipedia.org/wiki/IPv6_transition_mechanism), see section *[IPv6]*
- Performance measurements and optimizations
- Additional security, such as update policies for the device with exposed ports
- [Passpoint](https://www.wi-fi.org/discover-wi-fi/passpoint) (Hotspot 2.0)
- Propagating AP info using IEEE [802.11u\-2011](https://webresources.ruckuswireless.com/pdf/wp/wp-how-interworking-works.pdf)
- Create OpenWRT package of the protocol
- Can we store the VPN certificate in DNS (DANE) and retrieve it on the client (browser) using DoH?
<!--
- Additional SSID on SoC with PSK for legacy devices (IoT may not support EAP)
-->


<!--
Create a tool in JS that can runs in a browser,
that obtains the VPN (or any) certificate from DNS DANE records.


#### Hotspot 2.0

Can this protocol be improved by using
[Passpoint](https://www.wi-fi.org/discover-wi-fi/passpoint) (Hotspot 2.0)?
Could it eliminate the need for a shared SSID?

No shared SSID needed. See proposal.
No password field?
Username?
-->

