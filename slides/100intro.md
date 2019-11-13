
# Introduction

## We desire Wi-Fi

- Wi-Fi being "the best technology for Mobile Data Offloading (MDO)" [@gupta2012enhancing]

## Enabling Wi-Fi problematic

- concerns around security, violating terms / illegal content [@schneierwifi]
- laws prevent municipality provided "free WiFi" [@broadbandnow2019]
- telecommunications lobby against new projects [@regulatorycapture2019]

## When we access Wi-Fi

- users unaware of privacy risks [@consolvo2010]
- Free WiFi: captive portal
<!--
NOTE:
captive portals are like Cookie popup on website
-->



# Intro: Overcome mutual trust issue

Client tunnels via home router [@sastry2007architecting]

```
 ________                           ___________
|Client  |  |foreign|  |internet|  |Client's   |
|  ______|  |  AP   |  | (WAN)  |  |home AP    |
| |VPN   |  |_______|  |________|  |__________ |
| |Client|------------------------>|VPN server||
|_|______|  |¯¯¯¯¯¯¯|  |¯¯¯¯¯¯¯¯|  |__________||
```

- Client has no privacy leaks
- Wi-Fi AP[^ap] provider has no liability worries

[^ap]: Access Point

# Intro: example setup

!["Client connects to VPN endpoint via foreign AP"](img/physical_layout.png)


# Intro: Research Question

Can we design a protocol
&mdash; using existing protocols available on COTS (commercially off the shelf) clients
&mdash; that eliminates the need for trust between client and Wi-Fi provider,
using a VPN tunnel?

# Intro: Sub Questions

- Enforce network policies?
- Validate if VPN server listens on endpoint?
- Client communicate VPN endpoint to AP?
- Modify authentication (802.1x) server to enable this protocol?
- Verify protocol: Proof of Concept (PoC)?

# Intro: Questions TL;DR

- Design Protocol
- Test with PoC

# Intro: Related solutions

## Closed options

- Ad based: [World Wi-Fi](https://worldwifi.io)
- Education Roaming: Eduroam
- Government Roaming: [Govroam](https://govroam.nl/) <!-- https://govroam.be/ -->
- Share WiFi, earn points/data/credits: [Karma](https://yourkarma.com/wifi/how-it-works-3/)
- Home router managed by provider: KPN's [Fon](https://www.kpn.com/internet/wifi-hotspots/gratis-wifi-met-fon.htm)
- Paid / broker based: Tmobile/Vodafone hotspots

## Open solutions

- [Open Wireless Movement](https://openwireless.org/), backed by [Electronic Frontier Foundation](https://www.eff.org/issues/open-wireless)

