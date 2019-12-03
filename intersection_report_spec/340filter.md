### Network policies

It is in the interest of the AP provider to filter traffic,
therefore we state that it MAY
enforce network policies (+@fig:asciiartsetfilter)
on the link layer (L2) and SHOULD on L3 and L4.
However, no network policies are required for a valid implementation.

```
client  |hostapd  auth   pre  filter| |DHCP   WAN|   VPN
   |        |      |      |      |      |      |      |
   #        #      #      #--g-->#      |      |      |
   #        #      #<--h--#      |      |      |      |
   #        #<--i--#      |      |      |      |      |
   #<---j---#      |      |      |      |      |      |
   #---k-------------------------=----->#      |      |
   #<--------------------------------l--#      |      |
   #---m-------------------------=------------------->#
```
![Setting and enforcing network policies (snippet from +@fig:asciiartsequence)](/pixel.png){#fig:asciiartsetfilter}

The AP SHOULD allow all incoming traffic and only limit the outgoing,
preventing the need for connection tracking.

<!--
triangular routing not possible behind NAT
-->

We acknowledge that the proposed filtering/whitelisting
is minimal and that one might circumvent it by using it as a covert channel.
However,
we expect there to be little incentive for this type of abuse,
since anyone can join using a free VPN provider.

<!--
DNS covert channel;
it could be that the bandwidth of DNS queries in unlimited but normal traffic is.

potential issue for router:
attack on private network on router
Stow, A. Can you trust a wireless router?
http://www.cs.indiana.edu/~atsow/mal-router/.
Accessed Jul 15, 2007.

phony DNS server IP Address, forming the basis for a sophisticated "pharming"
attack [19].
Stamm, S., Ramzan, Z., and Jakobsson, M.
Drive-by pharming. Tech. Rep. 641, Dept. of
Computer Science, Indiana University, Dec 2006.
-->

Network policies MUST be valid for at least
12h (or at least as long as the DHCP lease),
after which the supplicant MAY
need to reconnect
to have access to its VPN again.
A longer time span such as 24h MAY
result in a laptop being disconnected during work the next day.

