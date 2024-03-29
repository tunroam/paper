## Related work

When it comes to regular APs,
the AP operator is able to see the traffic of the clients it facilitates,
giving the client less privacy and the operator more control on the network content.
In the context of Open Wireless, the EFF states
"that operators of open networks sometimes worry that they could be legally responsible if people use their networks to engage in copyright infringement."
[^effstates]
The topic of copyright for Open Wireless is discussed in a white paper
<!--
, which *should not be taken as legal advice*
-->
[@effcopyright].
Clients using our protocol are merely allowed to use VPN traffic,
making the AP a mere
[passive conduit](https://openwireless.org/myths-legal.html),
unable to read the traffic.
<!--
thus like any other router on the internet the traffic passes.
-->

[^effstates]: https://www.eff.org/wp/open-wi-fi-and-copyright-primer-network-operators

We need traffic prioritization to prevent "free riding" by neighbors
[@freeridersfear].
<!--
For our research we consider this subject out of scope.
-->

For National Research and Educational Networks
it was found that authentication via 802.1x
was more safe than a web portal and more scalable than using VPN-based authentication
[@wierenga2005eduroam].
They also mention that
standardization for wireless configuration
is required to prevent reconfiguration at different locations.
In our research the 802.1x authentication is used to provide the AP
with the VPN endpoint location.
The actual authentication is done by validating this VPN endpoint,
instead of the password field.


The Open Garden protocol plans to make every hotspot
a VPN exit node,
creating a decentralized VPN setup
<!--
The decentralized VPN setup with every hotspot being a VPN exit node
is planned to be part of the Open Garden protocol
-->
[@opengardenmedium].
This matches our
research where every AP
SHOULD
be a VPN server.

Unaware users can be made aware of their behavior
in order to improve security and privacy
[@consolvo2010].
However, we propose a technical solution instead of increasing awareness.

In the context of SlyFi;
"for such infrastructural solutions to be effective, they need both to be incorporated into wireless standards and to become widely deployed."
[@klasnja2009]
However, we will use the protocols available on COTS clients.


Wi-Fi Protected Access version 3 (WPA3) enables
privacy between clients by providing
individualized encryption.
However, this does not prevent the AP provider from eavesdropping.
Our research will use a VPN tunnel,
creating **end** (client) **to** VPN **end**point **encryption**.

When providers enable Wi-Fi sharing (e.g. using Fon) between homes,
they could enable Wi-Fi roaming,
preventing the IP address of the client to change when walking through a street.
This can also be done using this protocol at a larger network (e.g. campus),
but not between houses (independent APs).

Modern web browsers are starting to use encrypted DNS,
which will increase the client's privacy
[@ncscdns].
However, we propose to use a VPN tunnel,
which also hides additional data such as
the server name indication (SNI).


### Related wireless solutions

We present various
Wi-Fi solutions
to get an impression of existing approaches.


##### Open to selective users

There are Wi-Fi initiatives for specific groups of people,
such as [Eduroam](https://www.eduroam.org/) for students
and [Govroam](https://govroam.nl/) <!-- https://govroam.be/ -->
for government employees.
Various internet service providers (ISPs)
configure routers at home locations as Wi-Fi APs for their customers,
such as
Comcast's [xfinitywifi](https://hotspots.wifi.comcast.com/),
KPN's [Fon](https://www.kpn.com/internet/wifi-hotspots/gratis-wifi-met-fon.htm)
or
British Telecom's [BT Wi-fi](https://www.btwifi.co.uk/).

##### Open to all users

Various initiatives exist to provide free wireless for
communities and residential areas.
Fon provides residential WiFi in European cities and has its own router,
the Fonera [@fonfonera].
Fon has an option for paid users called "Bill"
and the "Linus" option to provide free access [@schneierwifi].
Other initiatives use [mesh](https://wiki.techinc.nl/MeshNet) networking
to create the wireless network,
such as
[FunkFeuer](https://wiki.p2pfoundation.net/Funkfeuer) in Austria,
[Freifunk](https://freifunk.net/en/what-is-it-about/) in Germany
and the
[Open Garden protocol](https://www.opengarden.com/protocol/).

Airports often provide broker based solutions,
such as
[iPass](https://www.ipass.com),
Tmobile/Vodafone hotspots,
or
[Boingo](https://www.boingo.com).
Alternative forms of payment include
ad based solutions,
examples are
[World Wi-Fi](https://worldwifi.io)
and the three-stage Stackelberg game based platform [@yu2017public].


##### Open to all providers and users

The following Wi-Fi solutions
allow anyone to create an AP.

The [Commotion Construction Kit](https://commotionwireless.net/docs/cck/) provides a "guide to building community wireless networks".
The [Open Wireless Movement](https://openwireless.org/)
provides software that can be installed on OpenWrt compatible routers.
This movement is backed by the [Electronic Frontier Foundation](https://www.eff.org/issues/open-wireless).
Other solutions offer Wi-Fi
in exchange for points/data/credits,
examples are
[Karma](https://yourkarma.com/wifi/how-it-works-3/)
and the
Open Garden protocol (which uses VPN) [@opengardenmedium].


<!--
- Ad based
  - [World Wi-Fi](https://worldwifi.io)
  - three-stage Stackelberg game based platform [@yu2017public]
- Education Roaming: Eduroam
- Government Roaming: [Govroam](https://govroam.nl/)
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
-->

<!--
TODO

https://patents.google.com/patent/US7568220B2/en
https://ieeexplore.ieee.org/abstract/document/7879333
https://patents.google.com/patent/US20060271485A1/en
https://www.zerotier.com
http://www.freefi.io/
WiFi4EU
-->

