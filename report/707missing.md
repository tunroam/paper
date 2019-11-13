## Limitations

We expect it to be unlikely that
this protocol will be supported by
ISP provided routers,
since using a home location as a VPN endpoint will double the traffic to that router
for a client when using it remotely.
This traffic also has impact on the latency and bandwidth of the client.


The specification states that the network
SHOULD enforce network policies,
which is not implemented in our setup.
While this does adhere to the specification,
it is an undesirable situation.
We argue that it is feasible to enforce network policies,
with the tool described in section *[Netfilter]*,
using the custom python script described in section
*[Implemented policies]*.


### Adherence specification

The Proof of Concept (PoC)
&mdash; created using the installation scripts &mdash;
does not adhere to the defined specification.

The ability to set the `validate_certificate` flag is not implemented
(to have the request being proxied to an external RADIUS server).
We argue this is possible (as seen in the implementation of the Eduroam network)
and considered it out of scope for this research.

The PoC currently proxies the request to a second authentication server
on the same device,
as described in section *[Inner-tunnel]*.

