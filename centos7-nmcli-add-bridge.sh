nmcli con add type bridge ifname br0
nmcli con add type bridge-slave ifname em2 master bridge-br0
