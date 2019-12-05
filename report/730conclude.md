## Conclusion

We have designed a protocol
using existing protocols available on commercially off the shelf (COTS) clients
that eliminates the need for trust between client and Wi-Fi provider by
using a VPN tunnel.
Q.E.D.


We showed how the *[802.1x identity]* can be used to communicate
the VPN endpoint of a supplicant to an AP,
answering sub-question 1 of our *[Research question]*.
Section *[Configuring FreeRADIUS]* details the modifications
we made to the *[802.1x authentication server]*
and section
*[Implemented policies]*
showed how the *[Network policies]* could be implemented,
answering sub-question 2.
To answer sub-question 3,
we detailed *[Network policies]*
that the AP MAY implement.

We showed through a Proof of Concept (PoC)
that a FreeRADIUS authentication server
is able to authorize a supplicant when they provide
a valid VPN endpoint,
answering sub-question 4 of our *[Research question]*.
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
