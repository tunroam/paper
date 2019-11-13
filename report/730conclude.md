## Conclusion

We have designed a protocol
&mdash; using existing protocols available on commercially off the shelf (COTS) clients
&mdash; that eliminates the need for trust between client and Wi-Fi provider,
using a VPN tunnel.
Q.E.D.

We showed through a Proof of Concept (PoC)
that a FreeRADIUS authentication server
is able to authorize a supplicant when they provide
a valid VPN endpoint.
The authentication server is able to
first validate the VPN endpoint and then
whitelist the endpoint through network policies.

The TUNroam protocol enables supplicants who have a VPN client installed,
to automatically connect (without captive portal)
to participating Wi-Fi networks.
The provider of the AP is able
to safely share his internet connection
through whitelisting VPN endpoints,
without liability concerns.
