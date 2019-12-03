## Research question

To understand the research question(s),
an example overview is given in
+@fig:onevpnconn,
where the client connects to an AP
using a VPN.

<!--
TODO this should be located somewhere else TODO
The VPN may be a VPN provider or its own home router with VPN server and modified AP.
This allows APs to whitelist VPN endpoints and creates an incentive to create an AP.
The AP provider gets a VPN endpoint,
allowing him to connect to foreign APs and increasing his privacy
on all networks through the VPN.
-->

![Client connects to VPN endpoint via foreign AP](img/vpn_connection.png){#fig:onevpnconn}


<!--
https://www.scribbr.com/methodology/qualitative-quantitative-research/
https://www.scribbr.com/research-process/research-questions/

TL;DR a research question should never be able to be answered with yes or no!
-->


- Can we design a protocol
&mdash; using existing protocols available on commercially off the shelf (COTS) clients
&mdash; that eliminates the need for trust between client and Wi-Fi provider,
using a VPN tunnel?
