
### Implemented policies

Section
*[Network policies]*
states that those policies are a
SHOULD have.
They are not implemented on the PoC for the following reasons:

- During the demo, an open WiFi (after identity validation) would be more desirable
- An actual implementation (e.g. on a campus) would not run all the components on the same device

Therefore the scripts outputs network policies instead of setting them.

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

<!--
done
-->


