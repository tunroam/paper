# Discussion
<!-- interpretations -->
<!--
https://www.scribbr.com/dissertation/discussion/
-->

Networks that only allow VPN traffic were already implemented,
but we showed that it is possible to allow for dynamic VPN endpoint validation
and whitelisting of specific IP protocols and ports.
We use the *[802.1x identity]* to communicate the VPN endpoint from the supplicant
to the 
*[802.1x authentication server]*.

Access Point (AP) providers can use this Open Source solution
to share their internet without liability concerns.
The protocol is decentralized, requiring no external dependencies
for the AP provider.

Users connecting to these APs have enhanced privacy
on all networks they connect to if they leave their VPN always on.
Users enjoy more Wi-Fi networks they can join
and are not presented a captive portal on networks implementing this protocol.

Potential AP providers include shared office space or housing,
consumer routers (e.g. by using a SoC)
or current open Wi-Fi providers.
These providers need to configure the modified authentication server
and allow it to set network policies.


<!--
Compare to Open Wireless, other research,
an implementation of
[@sastry2007architecting]


## Performance (speed)

- L2 Bridge, no NAT on SoC
- Existing router as 802.1x client
-->

