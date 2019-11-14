
  - How could the VPN endpoint details be communicated from the supplicant to the authentication server?
  - What modifications or configurations will enable an authentication (802.1x) server
to set network policies based on a VPN endpoint?
  - Which network policies are of interest to this protocol?
<!--
  - Which authentication protocols are available on COTS clients?
  - Which network policies need to be enforced?
    - Which VPN protocol(s) fit in the protocol?
    - What attributes do we need to validate to determine if a VPN server is listening on an endpoint?
    - How would a client communicate to the AP its VPN endpoint?
      - How could this VPN endpoint be whitelisted?
    - Which additional network protocols are needed for the protocol to work?
      - What are the security implications of allowing these additional protocols and what measures can be taken to address them?
  - What modifications or configurations are required to an authentication (802.1x) server to enable this protocol?
    - How would the authentication server change the network policies?
-->
  - Can we verify this protocol through a Proof of Concept (PoC)?



<!--
OLD

    - What additional traffic will be needed (e.g. DNS, DHCP, ARP)?
  - How can we limit client traffic to VPN traffic?
  - What are the implications of creating (or update an existing)
an authentication (802.1x) server,
to make it test a VPN endpoint and manage networking policies?
Can we design a protocol to eliminate the need for trust the Wi-Fi provider as the user?
- Can a protocol be designed that enables secure WiFi sharing through VPN utilization,
levering existing protocols available on COTS (commercially off the shelf) clients?
    - Can we determine if a VPN server is listening on an endpoint?
  - What are the implications of creating (or update an existing)
an authentication (RADIUS) server,
to make it test a VPN endpoint and manage networking policies?
  - What conditions need to be considered to determine
if a VPN server is listening on an endpoint?
Do we observe differences between vpn.students.os3.nl,
a commercial VPN provider and the VPN established in our research?
  - What measures can be taken to limit DNS requests on port 53 to VPN endpoint discovery?
- How do we signal that the IP of the VPN endpoint has changed?
  - How do we update this information (DNS)?
    - Authentication, Authorization, Accounting?
- Can we obtain the VPN certificate from DNS?
  - Use DNS over HTTPS (DoH) within a browser?
  - Share cert. using DANE?
- How can the AP filter DNS request to only allow VPN server discovery?
  - Can we prevent ISP logging by port 53 filtering and doing DoH?
  - Whitelist of DNS servers? (e.g. `['1.1.1.1','8.8.8.8']`)
  - Require specific subdomain name?
- Which Extensible Authentication Protocol (EAP)?
  - Which EAPs are supported by Commercial off-the-shelf (COTS)?


- What are the technical requirements for the proposed setup?
  - Can we demonstrate it? (Proof of Concept)
  - Can we compose a getting started and which audience will it target?


reliable protocol to enable distributed WiFi sharing?
- SoC with all
  - auth. server
  - VPN
  - DNS filtering
  - guide

-->
