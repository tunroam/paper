##### Psychology of adoption

Since the impact of this concept is dependent on the adoption,
we need to consider that limiting some users could actually increase the adoption of APs.
This could increase the
[network effect](https://en.wikipedia.org/wiki/Network_effect)
(as used in economics).

Clients specify the VPN they connect to,
being either a VPN provider
(not adding an extra AP to the network)
or another AP with VPN server,
as shown in +@fig:vpnlocations.

![Client connects to VPN endpoint via foreign AP](img/physical_layout.png){#fig:vpnlocations}

For larger parties providing free wifi,
there is no incentive to filter clients using a VPN provider.
Home providers of APs could desire to only allow clients
who also provide an AP.
This partisanship is also seen in
MIT License
versus
General Public License (GPL)
for software;
the former allows anyone to use it,
while the latter requires one to have the same shared value:
open source.

This concept could lead to the same
bigotry.
However, the AP is not able to distinguish the two parties
without a blacklist.
And even with a blacklist of DNS records,
one could duplicate the records under another apex,
pointing to the public VPN provider.

The requirement of providing an external RADIUS server
does not enforce this either.
Offering a free RADIUS server to couple with an existing VPN provider
will generate data for the RADIUS provider,
creating an incentive to create such a service.

<!--
We cannot exclude large entities,
they can *.nordvpn
or nordvpn.mywebsite.com => nordvpn


We want to be inclusive,
but not at the risk of loosing the market to one party.


forcing to have your own authentication server,
would increase the likelihood of additional APs,
since commercial VPN providers do not provide this.
However,
to enable the adoption by public Wi-Fi providers such as airports,
we do not enforce this,
since large providers are usually at a location where people actually look for Wi-Fi services,
thus the exposure to this protocol will be bigger.

If a commercial VPN provider would have a wildcard DNS record
(`*.vpnprovider.tld`),
a user is able to use this provider as is.
-->




