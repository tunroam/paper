
# Method: pre-authorize


```
$ validate_anonid.py 11443_06443_00testA@tunroam.lent.ink
WARNING the additional value is not a port number
INFO suggesting whitelist rules
{ 'iptables-nft -A OUTPUT -j ACCEPT -d tunroam.lent.ink \
     --protocol 17 --dport 443',
  'iptables-nft -A OUTPUT -j ACCEPT -d tunroam.lent.ink \
     --protocol 6 --dport 443' }
INFO Welcome aboard 11443_06443_00testA@localhost
```


- VPN endpoint validation
- Network policies


