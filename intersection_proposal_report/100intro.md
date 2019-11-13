# Introduction

Mobile devices use multiple wireless solutions,
with Wi-Fi being "the best technology for Mobile Data Offloading (MDO)"
[@gupta2012enhancing].
Providing internet access through free wireless has been seen
as politeness towards guests,
but concerns around
security, violating terms or possible abuse for illegal content
prevent individuals from providing open wireless networks
[@schneierwifi].
Larger entities who want to provide wireless services face different challenges.
There are laws in place that prevent
municipalities from providing "free WiFi"
[@broadbandnow2019]
and telecommunications companies lobby to prevent new projects 
[@regulatorycapture2019].

<!--
When people do have access to Wi-Fi,
they are concerned about their privacy.
This is observed by
doing an online search for 'Public WiFi',
which returns articles
on *Security* and *How to stay safe*.
These articles
commonly suggest to use a VPN.
-->

When it comes to users accessing Wi-Fi networks,
many are unaware of privacy risks
[@consolvo2010].
Users who are aware of the risks
&mdash; and do not take extra security measures &mdash;
place trust in the Wi-Fi provider when connecting to an access point (AP).

We can remove this trust issue between both parties
when accessing clients tunnel traffic via their home location
[@sastry2007architecting].
This creates privacy and security for the visiting client
and limits the traffic flowing through the Wi-Fi provider to VPN traffic.

The goal of this research is to develop a protocol that allows
secure Wi-Fi sharing by upgrading Wi-Fi APs.

\pagebreak
```
 ________                           ___________
|Client  |  |foreign|  |internet|  |Client's   |
|  ______|  |  AP   |  | (WAN)  |  |home AP    |
| |VPN   |  |_______|  |________|  |__________ |
| |Client|------------------------>|VPN server||
|_|______|  |¯¯¯¯¯¯¯|  |¯¯¯¯¯¯¯¯|  |__________||
```

When clients connect to an AP,
all their traffic goes to their own VPN tunnel endpoint.
