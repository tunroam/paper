# Results

Following the 
infrastructure as code (IaC)
paradigm,
the installation script[^tunroamnetworking]
proof that we are able to construct a setup
that enables the proposed protocol.

When we connected a client
(tested on Chrome OS and Android)
to the SoC broadcasting the SSID,
we were able to connect when
the VPN endpoint specified in the identity
pointed to a valid socket (tested with TCP and UDP).
This shows that the authentication server on the SoC does:

- VPN endpoint validation
- Identity validation
- Is able to derive whitelist rules from the `anonid`, as seen in section *[Implemented policies]*












#### Communicating VPN endpoint

*How could the VPN endpoint details be communicated from the supplicant to the authentication server?*



<!--
Part of our initial research questions were:

- Which VPN protocol(s) fit in the protocol?
- What attributes do we need to validate to determine if a VPN server is listening on an endpoint?
-->


VPN servers might aim to appear as a different service,
such as a HTTPS web server,
to avoid being blocked.
<!--
We found that some VPN servers aim to be hard to detect as a VPN server.
-->
Therefore the current protocol only verifies if a socket is open,
without any additional checks.
This approach allows clients to use different *[VPN protocols]*.










#### Implementing the protocol

*What modifications or configurations will enable an authentication (802.1x) server to set network policies based on a VPN endpoint?*

<!--
- How would a client communicate to the AP its VPN endpoint?
- What modifications or configurations are required to an authentication (802.1x) server to enable this protocol?
-->

We showed that the client is able to communicate the VPN endpoint using the
*[802.1x identity]*.
This requires modifications to the *[802.1x authentication server]*,
without changing to authentication client (`hostapd`)
or supplicant (e.g. smartphone).

We described the modifications to the RADIUS server in section
*[FreeRADIUS modifications]*.
















#### Policies

*Which network policies are of interest to this protocol?*

It is in the interest of the AP provider to use
*[Network policies]*
The AP want to


## Whitelisting

- How could this VPN endpoint be whitelisted?
- How would the authentication server change the network policies?

We showed example firewall rules that can be implemented.
In our *[Test setup]*, these rules can be set by the custom *[Python3]* script,
triggered in the authentication server.


<!--
- Which network policies need to be enforced?
  - Which additional network protocols are needed for the protocol to work?
    - What are the security implications of allowing these additional protocols and what measures can be taken to address them?
-->

The connecting client needs access to its VPN endpoint
and MUST be able to do a DNS query to find the IP address of its VPN server.

The network policies on the local network can be limited to management protocols.
Specific rules are open to the implementer,
as long as the client is able setup a connection to its VPN server.












<!--
*Q: Which authentication protocols are available on COTS clients?*

We used PEAP with MS-CHAPv2,
as motivated in *[EAP protocols]*.
-->









#### Testing the protocol

*Can we verify this protocol through a Proof of Concept (PoC)?*

The PoC used at the presentation demo shows that the protocol is feasible.
When clients attempt to connect, the authentication server validates their
VPN endpoint and is able to set *[Network policies]*.
The PoC was creating using the installation scripts[^tunroamnetworking].


#### Additional

The following findings do not contribute
to the protocol we ought to develop,
however,
they do provide insights for future research.

- The router used for our research is able to function as a RADIUS client,
however, this was
[disabled](https://www.draytek.com/support/knowledge-base/5680)
by the ISP and updating this firmware was deemed infeasible
[@lentinkrouterisp]
- Some IoT electronics we tested only support WiFi using pre-shared key (PSK) <!-- and IPv4 -->
- OpenWrt has options for remote control[^openwrtremote],
which allows
&mdash; an external authentication server supporting this protocol &mdash;
to push network policies.

[^openwrtremote]: https://openwrt.org/docs/guide-user/services/remote_control/ostiary.server

