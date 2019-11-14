## EAP protocols

<!--
Good intro on the matter:
https://sites.google.com/site/amitsciscozone/home/switching/peap---protected-eap-protocol
-->

This section details the selection of the EAP protocol we use.
We initially looked at which EAP protocols are
available by default on consumer electronics,
which do not authenticate via cellular/SIM.

The mobile devices are composed of an older (5.1)
and supported version (9)
of the Mobile Operating System with the largest market share
[@mobilestatcounter].
For the desktop environments we looked at a corporate Windows laptop and Chrome OS.
The data on Apple devices is retrieved from `*.apple.com`.

### Android 5.1 (Moto G first gen.)

- 802.1x EAP
  - PEAP
    - None
    - MSCHAPV2
    - GTC
  - TLS
  - TTLS
    - None
    - PAP
    - MSCHAP
    - MSCHAPV2
    - GTC
  - PWD

### Android 9 (Mi A1, Android ONE)

- 802.1x EAP
  - PEAP
    - None
    - MSCHAPV2
    - GTC
  - TLS
  - TTLS
    - None
    - PAP
    - MSCHAP
    - MSCHAPV2
    - GTC
  - PWD


### Chrome OS (77.0.3865.35)

- EAP
  - LEAP
  - PEAP
    - EAP-MD5
    - MSCHAPV2
  - EAP-TLS
  - EAP-TTLS
    - EAP-MD5
    - MSCHAP
    - MSCHAPV2
    - PAP
    - CHAP
    - GTC

### Mac

<!--
Recommendations: https://opensource.apple.com/source/freeradius/freeradius-42/freeradius/raddb/eap.conf.auto.html
Manual: https://www.eduroam.us/node/102
additional: https://www.apple.com/ca/business/resources/docs/macOS_Security_Overview.pdf
-->

- 802.1x
  - TLS
  - EAP–FAST
  - MD5
  - LEAP
  - TTLS [@ttlstypesmac]
    - PAP
    - EAP
    - CHAP
    - MSCHAP
    - MSCHAPv2
  - PEAP [@peaptypesmac]
    - MSCHAPv2
    - MD5
    - GTC

<!--
https://opensource.apple.com/source/freeradius/freeradius-25/freeradius/doc/rlm_eap.auto.html
  rlm_eap/types -- contains all the supported EAP-Types
  rlm_eap/types/rlm_eap_md5  -- EAP-MD5 authentication.
  rlm_eap/types/rlm_eap_tls  -- EAP-TLS based authentication.
  rlm_eap/types/rlm_eap_ttls -- TTLS based authentication.
  rlm_eap/types/rlm_eap_peap -- Windows PEAP based authentication.
  rlm_eap/types/rlm_eap_leap -- Cisco LEAP authentication.
  rlm_eap/types/rlm_eap_sim  -- EAP-SIM (GSM) based authentication
-->


### iOS

The following applies to *iOS 12.3 and later*
[@iostypes].

- 802.1X
  - PEAP
  - EAP-TLS
  - EAP-TTLS
  - EAP-FAST


### Windows 10 (1803)

- WPA2-Enterprise AES
  - Smart Card or other certificate
  - Protected EAP (PEAP)
    - Smart Card or other certificate
    - Secured password (EAP-MSCHAP v2)
  - EAP-TTLS
    - Unencrypted password (PAP)
    - Challenge Handshake Authentication Protocol (CHAP)
    - Microsoft CHAP (MS-CHAP)
    - Microsoft CHAP Version 2 (MS-CHAP v2)
    - Smart Card or other certificate
    - Secured password (EAP-MSCHAP v2)
- 802.11x WEP
  - Protected EAP (PEAP)
    - Smart Card or other certificate
    - Secured password (EAP-MSCHAP v2)
  - EAP-TTLS
    - Unencrypted password (PAP)
    - Challenge Handshake Authentication Protocol (CHAP)
    - Microsoft CHAP (MS-CHAP)
    - Microsoft CHAP Version 2 (MS-CHAP v2)
    - Smart Card or other certificate
    - Secured password (EAP-MSCHAP v2)

### Intersection

The intersection of the observed devices gives us:

- 802.1x
  - PEAP
    - MS-CHAP v2
  - TTLS
    - PAP
    - MSCHAP
    - MSCHAPV2

However, on Windows 7 TTLS requires additional software
[@win7eap].
This results in **PEAP-MSCHAPv2**,
which is also suggested by
FreeRADIUS[^freeradiusmschap]
and available at many Eduroam networks,
such as those at the
[University of Amsterdam](https://extranet.uva.nl/content/a-z/draadloos-internet-voor-bezoekers/beveiliging/beveiliging.html?1571231074718),
[University Utrecht](https://handleidingen.uu.nl/handleiding/eduroam-op-chromeos/),
[Cornell](https://it.cornell.edu/wifi/connect-eduroam-android),
[Rijks University Groningen](https://www.rug.nl/umcg/diensten/ictsupport/produktendiensten/handleidingen2/eduroam-windows7.pdf),
[Leiden University](https://www.student.universiteitleiden.nl/binaries/content/assets/ul2staff/ict/handleidingen/manual-connecting-to-wifi-2018-eng.pdf),
[University of Edinburgh](https://www.ed.ac.uk/information-services/computing/desktop-personal/wifi-networking/configure-device/eduroam-android)
and
[MIT](http://kb.mit.edu/confluence/pages/viewpage.action?pageId=152599592).

[^freeradiusmschap]: https://networkradius.com/doc/current/raddb/mods-available/eap/peap.html

<!--
Eduroam itself also supports TTLS [@eduroameap],
[Radboud UMC](https://www.radboudumc.nl/en/education/target-audiences/students/general-information-for/academic-students/wireless-network)
uses *TTLS-MSCHAPv2* for its Eduroam network and
[Vrije Universiteit](https://www.vu.nl/en/about-vu-amsterdam/contact-info-and-route/departments/information-technology/eduroam/index.aspx)
uses *TTLS-PAP*.
-->

