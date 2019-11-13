# Method: example flow 1/3


```
                   AP (SoC) <-----L2----> router
         _____________|_____________   _____|____
client  |hostapd  auth   pre  filter| |DHCP   WAN|   VPN
   |        |      |      |      |      |      |      |
   a        |      |      |      |      |      |      |
   #---b--->#      |      |      |      |      |      |
   #        #--c-->#      |      |      |      |      |
   #        #      #--d-->#      |      |      |      |
   #        #      #      #--e----------------------->#
   #        #      #      f      |      |      |      |
   #        #      #      #--g-->#      |      |      |
   #        #      #<--h--#      |      |      |      |
   #        #<--i--#      |      |      |      |      |
   #<---j---#      |      |      |      |      |      |
   #---k-------------------------=----->#      |      |
   #<--------------------------------l--#      |      |
   #---m-------------------------=------------------->#
```


# Method: example flow 2/3


```
                   AP (SoC) <-----L2----> router
         _____________|_____________   _____|____
client  |hostapd  auth   pre  filter| |DHCP   WAN|   VPN
   |        |      |      |      |      |      |      |
   a        |      |      |      |      |      |      |
   #---b--->#      |      |      |      |      |      |
   #        #--c-->#      |      |      |      |      |
   #        #      #--d-->#      |      |      |      |
   #        #      #      #--e----------------------->#
```

a. client (supplicant) scans for AP, finds foreign AP with SSID of protocol
b. supplicant => authenticator (`hostapd`), VPN endpoint location in 802.1x identity
c. authenticator => authentication server
d. authentication server => custom `pre`-authorize script
e. provided info points to a VPN server?

# Method: example flow 3/3


```
client  |hostapd  auth   pre  filter| |DHCP   WAN|   VPN
   #        #      #      f--g-->#      |      |      |
   #        #      #<--h--#      |      |      |      |
   #        #<--i--#      |      |      |      |      |
   #<---j---#      |      |      |      |      |      |
   #---k-------------------------=----->#      |      |
   #<--------------------------------l--#      |      |
   #---m-------------------------=------------------->#
```

f. `if VPN: continue else return` 802.1x rejected
g. allow (whitelist) egress for provided VPN details
h. OK
i. OK
j. 802.1x client accepted (`wlan` bridged (L2) with `eth0`)
k. client requests DHCP lease (IP address)
l. router provides IP to client (thus NAT* in router)
m. client => VPN server

\* Network Address Translation

# Method: example flow TL;DR

- SoC connected to router =
  - VPN server
  - Wi-Fi AP
  - Authentication server
- When your phone finds foreign AP
  - AP whitelists VPN server
  - phone uses VPN

