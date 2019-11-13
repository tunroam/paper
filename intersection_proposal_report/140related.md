## Related work

When it comes to regular APs (access point),
the operator is able to see the traffic of the clients it facilitates,
giving the client less privacy and the operator more control on the network content.
In the context of Open Wireless, the EFF states
["that operators of open networks sometimes worry that they could be legally responsible if people use their networks to engage in copyright infringement."](https://www.eff.org/wp/open-wi-fi-and-copyright-primer-network-operators)
The topic of copyright for Open Wireless is discussed in a white paper
<!--
, which *should not be taken as legal advice*
-->
[@effcopyright].
Clients in our research only have VPN traffic,
making the AP a mere
[passive conduit](https://openwireless.org/myths-legal.html),
unable to verify the traffic.
<!--
thus like any other router on the internet the traffic passes.
-->

We need traffic prioritization to prevent "free riding" by neighbors
[@freeridersfear].
For our research we consider this subject as out of scope.

For National Research and Educational Networks
it was found that authentication via 802.1X
was more safe than a web portal and more scalable than using VPN-based authentication
[@wierenga2005eduroam].
They also mention that
standardization for wireless configuration
is required to prevent reconfiguration at different locations.
In our research the client does not authentication to our AP,
but provides it with the VPN endpoint location,
using fields in the 802.1X authentication.
This will allow the AP to whitelist traffic for that VPN endpoint.

The decentralized VPN setup with every hotspot being a VPN exit node
is planned to be part of the Open Garden protocol
[@opengardenmedium].
In our research every AP
SHOULD
be a VPN server,
creating decentralized VPN servers.

Unaware users can be made aware of their behavior
in order to improve security and privacy
[@consolvo2010].
However, we propose a technical solution instead of increasing awareness.

In the context of SlyFi;
"for such infrastructural solutions to be effective, they need both to be incorporated into wireless standards and to become widely deployed."
[@klasnja2009]
However, we will use the protocols available on modern clients.

Wi-Fi Protected Access version 3 (WPA3) protects clients privacy by
preventing other users of the AP from being able to see their traffic.
However, this does not prevent the AP provider from eavesdropping.
Our research will use a VPN tunnel,
preventing the AP provider from seeing the traffic.

When providers create Wi-Fi sharing (e.g. using Fon) between homes,
they could enable Wi-Fi roaming,
preventing the IP address of the client to change when walking through a street.
This can also be done using this protocol at a larger network (e.g. Airport),
but not between houses in a street (independent APs).

Modern web browsers are starting to use encrypted DNS,
which will increase the client's privacy
[@ncscdns].
However, we propose to use a VPN tunnel,
which also hides additional data such as
the server name indication (SNI).


### Related (free) wireless solutions

To get an impression of the desire for WiFi solutions,
we present a list of examples:

- Ad based
  - [World Wi-Fi](https://worldwifi.io)
  - three-stage Stackelberg game based platform [@yu2017public]
- Education Roaming: Eduroam
- Government Roaming: [Govroam](https://govroam.nl/) <!-- https://govroam.be/ -->
- [Open Wireless Movement](https://openwireless.org/), which is backed by [Electronic Frontier Foundation](https://www.eff.org/issues/open-wireless)
- Share WiFi, earn points/data/credits
  - [Karma](https://yourkarma.com/wifi/how-it-works-3/)
  - Open Garden protocol (uses VPN) [@opengardenmedium]
- Home routers managed by providers/national operator:
  - Comcast's [xfinitywifi](https://hotspots.wifi.comcast.com/)
  - KPN's [Fon](https://www.kpn.com/internet/wifi-hotspots/gratis-wifi-met-fon.htm)
  - British Telecom's [BT Wi-fi](https://www.btwifi.co.uk/)
- Free wireless in cities/communities/residential areas
  - Fon provides residential WiFi in European cities and has its own router, the Fonera [@fonfonera]. Fon has an option for paid users called 'Bill' and the 'Linus' option to provide free access [@schneierwifi]
  - The [Commotion Construction Kit](https://commotionwireless.net/docs/cck/): "guide to building community wireless networks"
  - Using [mesh](https://wiki.techinc.nl/MeshNet) networking
    - [FunkFeuer](https://wiki.p2pfoundation.net/Funkfeuer) in Austria
    - [Freifunk](https://freifunk.net/en/what-is-it-about/) in Germany
    - [Open Garden protocol](https://www.opengarden.com/protocol/)
- Paid / broker based
  - [iPass](https://www.ipass.com)
  - Tmobile hotspots
  - Vodafone hotspots
  - [Boingo](https://www.boingo.com)


<!--
TODO

https://patents.google.com/patent/US7568220B2/en
https://ieeexplore.ieee.org/abstract/document/7879333
https://patents.google.com/patent/US20060271485A1/en
https://www.zerotier.com
http://www.freefi.io/
-->

