## Pseudo code parse identity

We prove some example code in ECMAScript 6,
which can be tested in the terminal of a web browser.

```javascript
// https://tools.ietf.org/html/rfc4648 section 6
const BASE32_STR = 'abcdefghijklmnopqrstuvwxyz234567'
// https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
const MY_SUPPORTED_IP_PROTOCOLS = {
  '0x06' : (dest,port) => {return whitelist(dest,'tcp',port)},
  '0x11' : (dest,port) => {return whitelist(dest,'udp',port)},
  '0x32' : (dest)      => {return whitelist(dest,'esp')},
  '0x33' : (dest)      => {return whitelist(dest,'ah')}
}
function whitelist(dest, protocol, port){
  var result = "iptables-nft -A OUTPUT -j ACCEPT -d " + 
               dest + " --protocol " + protocol
  if (port) return result + " --dport " + port
  else return result
}
function char_to_flags(char){
  const i = BASE32_STR.indexOf(char.toLowerCase())
  if (i === -1) return false
  // We prefix zeros for when the value is less than 16
  const binary_str = '0000' + (i).toString(2)
  return {
    validate_cert: Number(binary_str.substr(-1,1)),
    RESERVED0    : Number(binary_str.substr(-2,1)),
    RESERVED1    : Number(binary_str.substr(-3,1)),
    RESERVED2    : Number(binary_str.substr(-4,1)),
    RESERVED3    : Number(binary_str.substr(-5,1))
  }
}
function isIPaddr(str){ // up to implementer to insert regex for ipv4/ipv6
  return true
}
// WARNING this code does no input validation
function parseIdentity(id){
  const userpart = id.split('@')[0].toLowerCase()
  const realm    = id.split('@')[1].toLowerCase()
  const flags_char = userpart[userpart.length-1]
  const server_addr = realm
  if (! isIPaddr(realm) &&
        (realm.indexOf('tunroam.') === -1))
    return "ERROR required subdomain missing in hostname"
  var requested_list = userpart.substr(0,userpart.length-1).split('_')
  var rulelist = []
  for (const i of requested_list){
    const prid = '0x' + i.substr(0,2) // protocolid
    const additional_info = i.substr(2)
    if (additional_info == '53') return 'Rejected, no DNS port allowed'
    if (prid in MY_SUPPORTED_IP_PROTOCOLS){
      const rule = MY_SUPPORTED_IP_PROTOCOLS[prid](server_addr,additional_info)
      rulelist.push(rule)
    }
  }
  return {
    rules : rulelist,
    server_addr: server_addr,
    flags: char_to_flags(flags_char)
  }
}

parseIdentity('11500_114500_32_33a@10.10.10.10')
```
