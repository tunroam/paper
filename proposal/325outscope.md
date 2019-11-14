### Expected future work (out of scope)

- Auto updating DNS record for APs with no fixed IP address
- Bandwidth management
- Quality of Service (QoS)
- Interoperability between [IPv6 and IPv4](https://en.wikipedia.org/wiki/IPv6_transition_mechanism)
- Performance measurements and optimizations
- Additional security, such as update policies for the device with exposed ports
- Functional 802.1x authentication server to authenticate clients at their home location
- Additional SSID with PSK for legacy devices (IoT may not support EAP)
- [Passpoint](https://www.wi-fi.org/discover-wi-fi/passpoint) (Hotspot 2.0)
- Propagating AP info using IEEE [802.11u\-2011](https://webresources.ruckuswireless.com/pdf/wp/wp-how-interworking-works.pdf)
- Create OpenWrt package of the protocol
- Can we store the VPN certificate in DNS (DANE) and retrieve it on the client (browser) using DoH?

#### 802.11u

For this research we use a shared SSID,
just like Eduroam does.
It might be possible to propose a new
'Access Network Type' to the 802.11u specification
or use the 'Venue Name information' field.

Another option is to use the
'Network Authentication Type' field to redirect to a local server
and have the required configuration stored in localStorage in the browser.

