## FreeRADIUS modifications

This section shows some of the modifications
done on the FreeRADIUS server.
For the Python code and the installation script,
visit the source code[^authserver].

[^authserver]: https://github.com/tunroam/auth-server

### Overview FreeRADIUS configuration

- `radiusd.conf` configuration loaded by daemon
  - some general configuration
  - INCLUDE `proxy.conf`
  - INCLUDE `client.conf`
  - modules section
    - INCLUDE `mods-enabled/`
  - policy section
    - INCLUDE `policy.d/`
  - INCLUDE `sites-enabled/`

We observe that the main configuration includes 3 files in its main context.

### Pre-authorize

The
[`rlm_python`](https://wiki.freeradius.org/modules/Rlm_python)
module provides a
[template](https://github.com/FreeRADIUS/freeradius-server/blob/v3.0.x/src/modules/rlm_python/example.py)
and an
[example](https://github.com/FreeRADIUS/freeradius-server/blob/v3.0.x/src/modules/rlm_python/prepaid.py)
script.
How to call the Python functions,
is shown in
[`experimental.conf`](https://github.com/FreeRADIUS/freeradius-server/blob/v3.0.x/raddb/experimental.conf).
The mapping to the function names is done in `mods-available/python`.
The functions are able to being called through
[`rlm_attr_filter`](https://freeradius.org/modules/?mod=rlm_attr_filter).

```
# $ apropos rlm_ # use this to find other modules
$ man rlm_attr_filter|grep -A 18 SECTIONS|grep -v ^$
SECTIONS
       preacct
              Filters Accounting-Request packets.
       accounting
              Filters Accounting-Response packets.
       pre-proxy
              Filters Accounting-Request or Access-Request packets prior to proxying them.
       post-proxy
              Filters Accounting-Response, Access-Accept, Access-Reject, or Access-Challenge responses from a home server.
       authorize
              Filters Access-Request packets.
       post-auth
              Filters Access-Accept or Access-Reject packets.
```

We implement the protocol in the authentication server
by setting it as an
`authorize`
function.
We inserted it before (P)EAP,
enabling the script to judge if to Accept or Reject.

When running the authentication server in debug mode,
we observed that it first goes through the `authorize` section:

```
freeradius -X &
echo "User-Name=bob,Chap-Password=hello" | radclient -x localhost auth testing123

Sent Access-Request Id 77 from 0.0.0.0:32774 to 127.0.0.1:1812 length 44
        User-Name = "bob"
        CHAP-Password = 0xc01e12815a584bfb57210f5435ff843b8a
        Cleartext-Password = "hello"
(0) Received Access-Request Id 77 from 127.0.0.1:32774 to 127.0.0.1:1812 length 44
(0)   User-Name = "bob"
(0)   CHAP-Password = 0xc01e12815a584bfb57210f5435ff843b8a
(0) # Executing section authorize from file /etc/freeradius/3.0/sites-enabled/default
(0)   authorize {
(0)     policy filter_username {
```

### Python3

We observe that the package manager on Raspbian 10 provides `v3.0.17`,
while Github provides `v3.0.20` which has
[Python3](https://github.com/FreeRADIUS/freeradius-server/blob/v3.0.x/raddb/mods-available/python3).
The discussion on Github suggests it will use a different format
and
&mdash; at the moment of writing &mdash;
is under active development[^python3discuss].
We will create our script using Python3, since Python2 is EOF (end of life)
in less than two months.

[^python3discuss]: https://github.com/FreeRADIUS/freeradius-server/issues/2351

The Python3 script is called from Python2,
see the source code[^authserver] for details.

### CHAP

For the *Challenge-Handshake Authentication Protocol* to be performed,
the server needs to know the plaintext password.

For the authentication we used
[`rlm_eap_peap`](https://networkradius.com/doc/current/raddb/mods-available/eap/peap.html)
which is a submodule of
[`rlm_eap`](https://networkradius.com/doc/current/raddb/mods-available/eap.html),
which will use
[`rlm_eap_mschapv2`](https://networkradius.com/doc/current/raddb/mods-available/eap/mschapv2.html),
which in turn requires
[`rlm_mschap`](https://networkradius.com/doc/current/raddb/mods-available/mschap.html).

The server validates the password using the `innerid` and the password field
configured in the supplicant.
FreeRADIUS allows to have a second server
(locally or proxy to external for the `validate_certificate` flag)
to do the password validation inside the TLS tunnel (used in PEAP and TTLS).

We used FreeRADIUS by running two servers
as described in section
*[Inner-tunnel]*.

The inner tunnel needs the plaintext password,
which we set in the `authorize` module using a custom
Python script:

```python
  return RLM_MODULE_OK, (), \
    ( ('Cleartext-Password', 'password'), )
```

