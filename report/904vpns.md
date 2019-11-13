## VPN protocols

*Q: Which VPN protocol(s) are supported on COTS clients?*

We reason that providers of paid VPN service want to support the VPN
protocols with the largest market adoption.
From the subset of these protocols we explore which one would
be the best for our use case.


We took the top VPN providers from three comparisons articles.
The top two ranked were
NordVPN and ExpressVPN
[@cnetvpns]
[@vpndiensten]
[@itpvpns].

<!--
For this research we want to include tests with external VPN providers.
We use free VPN providers for this use case.

When looking at
[a comparison](https://vpndiensten.nl/informatie/providers/gratis-vpn/) of
Free VPN providers;
ProtonVPN which has an unlimited but slow connection
and Windscribe which has 10GB free each month
-->

<!--
Protocol comparisons:
https://restoreprivacy.com/openvpn-ipsec-wireguard-l2tp-ikev2-protocols/
https://www.giganews.com/vyprvpn/compare-vpn-protocols.html
https://www.ivpn.net/pptp-vs-ipsec-ikev2-vs-openvpn-vs-wireguard
-->

### NordVPN

NordVPN lists the following options[^nordvpn]:

[^nordvpn]: https://nordvpn.com/tutorials/linux/

- OpenVPN
- IKEv2/IPsec

### ExpressVPN

ExpressVPN lists the following options[^expressvpn]:

[^expressvpn]: https://www.expressvpn.com/support/vpn-setup/#linux-setup

- OpenVPN
- PPTP MPPE: MSCHAP, MSCHAPv2 (PPTP is less secure)


When we look at these protocols,
both IKEv2/IPsec and OpenVPN are secure solutions.
Chromebooks
[require L2TP](https://support.google.com/chromebook/answer/1282338?hl=en)
for using IKEv2,
which requires more open ports than OpenVPN.
OpenVPN allows us to filter on one port for UDP,
which is what we will use during our research.


### OpenVPN

OpenVPN will
"always first try UDP, and if that fails, then try TCP."[^openvpnudp]
This allows our AP to whitelist UDP traffic,
enabling the client to use TCP on other networks where UDP is blocked.
This is the second motivation for picking OpenVPN over IPsec
during testing.

[^openvpnudp]: https://openvpn.net/faq/why-does-openvpn-use-udp-and-tcp/

### Preinstalled

We observed that OpenVPN is usually not supported by default on OSes
(except Chromebook) but IPsec based tunnels are.
This made us decide that the protocol would support
*[Multiple protocols and ports]*.


### Suggestion

The VPN provides a client with access to APs implementing this protocol.
The VPN will also provide additional security when using other WiFi APs.
We therefore suggest to use a VPN on all foreign Wi-Fi networks.

One MAY use OpenVPN with port 443 TCP and UDP.
This will work on regular public Wi-Fi that have
TCP 443 (HTTPS) whitelisted.

