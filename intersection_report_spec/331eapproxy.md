##### Stripping realm

When the supplicant indicates
&mdash; by setting the `validate_certificate` flag &mdash;
it needs the authentication request to be proxied,
the authentication server
serves as a NAS
([Network Access Server](https://wiki.freeradius.org/glossary/NAS)).
The server
MAY
[strip](https://github.com/FreeRADIUS/freeradius-server/blob/v3.0.x/raddb/proxy.conf)
the realm part of the identity when forwarding the authentication request.

##### Motivation

The external RADIUS server proxied to enables the supplicant to be presented with the same
certificate at each AP it visits.
It is in the interest of the supplicant
&mdash; who is the maintainer of the authentication server proxied to &mdash;
that it accepts all requests at all time.
Thus the server does not need the realm information.

We allow the proxying authentication server to
[`strip`](https://github.com/FreeRADIUS/freeradius-server/blob/v3.0.x/raddb/proxy.conf)
the realm part of the identity.
This is the default behavior of FreeRADIUS.

When desired, the server responding to the request MAY
obtain its realm via reverse DNS.

