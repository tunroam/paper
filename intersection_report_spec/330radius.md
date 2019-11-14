### 802.1x authentication server

#### validate_certificate
<!--
The following states that Windows only allows change of username for identity
https://security.stackexchange.com/questions/100684/what-is-anonymous-identity-in-enterprise-wpa
-->

When the `validate_certificate` flag is set in the `anonid`,
`vpn.<DOMAIN-IN-INNERID>` is resolved for the VPN address
and
`<DOMAIN-IN-INNERID>`
for the authentication server.
If a supplicant provides an IP address instead of
a FQDN,
the AP
MUST
use this IP address for both.

The request proxied to
the external server
MUST
use the RADIUS protocol
([RFC 2058](https://tools.ietf.org/html/rfc2058))
on UDP 1812
(not to be confused with UDP 1645, as mentioned in
[RFC2138](https://tools.ietf.org/html/rfc2138))
using the secret 'testing123'
(FreeRADIUS default).


Example FreeRADIUS
[client.conf](https://github.com/FreeRADIUS/freeradius-server/blob/v3.0.x/raddb/clients.conf):

```
client acceptall {
	ipv4addr = *	# any
	proto = udp
	secret = testing123
}
```


The `innerid` MAY hold actual user credentials,
not used by the AP but by the authentication server proxied to.

<!--
Anonymous Identities: https://www.interlinknetworks.com/app_notes/eap-peap.htm
https://security.stackexchange.com/questions/182530/is-it-possible-for-an-802-1x-network-peap-mschapv2-to-have-no-certificate
-->

If the AP desires to do VPN endpoint validation,
it MUST complete the validation step
before proxying the authentication request.
If the VPN endpoint validation fails,
the authentication request is rejected without forwarding the request.


##### Motivation

802.1x supplicants like iOS require the validation of a certificate
and other systems (e.g. Windows) require admin rights to disable validation.

Some supplicants have the option to disable certificate validation,
allowing every AP to use a unique self signed certificate.
For clients that validate certificates
(e.g. [Windows](https://support.microsoft.com/en-us/help/814394/certificate-requirements-when-you-use-eap-tls-or-peap-with-eap-tls)),
we need to present a certificate that is trusted by the client.
We have two options,
provide a certificate that is signed by a trusted certificate authority
like Let's Encrypt.
However, this requires the private key to be shared to every AP,
allowing anyone to revoke this certificate.
Another solution is to proxy the request to a authentication server the supplicant trusts.

<!--
The following guide shows how to disable validation in windows
https://www.draytek.com/support/knowledge-base/5759
however, we verified that this requires admin rights.

https://docs.microsoft.com/en-us/windows-server/networking/technologies/nps/nps-manage-cert-requirements
https://www.reddit.com/r/networking/comments/4uvzir/using_lets_encrypt_for_windows_nps_8021x_cert/
https://framebyframewifi.net/2017/01/29/use-lets-encrypt-certificates-with-freeradius/
-->

We suggest to install the specific server certificate in the supplicant,
since
[validating the common name (CN)](https://www.securew2.com/blog/8021x-vs-https-server-certificate-validation/)
of a certificate works for a DNS name but is not feasible for all supplicants
(e.g. Android 9 supports it, on a Chrome OS it is not an option).




Two DNS records are needed
to allow the authentication server
and VPN server to be on a different IP address.

The realm part of
the authentication server
stays the same,
requiring no modifications when proxying the request.
Since the VPN endpoint validation requires an update to the authentication server
&mdash; to support this protocol &mdash;
we require this custom script to implement the DNS logic (i.e. prefix `vpn.`).

While Diameter
([RFC3588](https://tools.ietf.org/html/rfc3588))
is a newer protocol,
RADIUS was chosen since it is a widely adopted protocol
in existing wireless infrastructures and routers.

