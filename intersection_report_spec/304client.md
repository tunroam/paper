## Protocol: Supplicant / client

The motivation for the settings of the client can be found in *[Protocol: AP Specification]*.
The client needs to configure two aspects,
the 802.1x wireless configuration
and a VPN client.

The following information is required:

- domain or IP of VPN server
- IP protocol(s) (and port number(s)) of VPN server
- will the supplicant validate the 802.1x certificate?
  - No (default)
  - Yes; client needs to set up an external authentication server

