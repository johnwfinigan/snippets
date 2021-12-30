Binaries at https://github.com/zrepl/zrepl/releases

Docs at https://zrepl.github.io/

Tested with v0.4

The two yml files would be copied to /etc/zrepl/zrepl.yml on sender and receiver, respectively.

deb files set up a proper systemd service for zrepl

root authorized_keys on receiver looks like

command="zrepl stdinserver s_server",restrict ssh-ed25519 ABCD...

Todo - run unprivileged?
