#These commands will take the UUIDs of xenserver VMs and output ISC DHCPD config file lines to 
#give them DHCP reservations.
#File example-uuids should contain the UUIDs of the VMs you want to make DHCP reservations for.
#
#One UUID per line. Intended to use the output of xe vm-copy or xe vm-clone
#
#Note to anti-useless-use-of-cat types: it makes pipelines read left to right. 

#selects first virtual NIC and gets its MAC only
cat example-uuid |  awk '{print "xe vif-list device=0  params=MAC vm-uuid=" $1}' | sh | awk '{print $5}' | sed  '/^$/d' > example-mac

#N is the starting IP's last byte (assumes 192.168.1.0/24 here). 203 is not special, just a sample.
#exampleprefix is the host name prefix to be combined with N for a placeholder hostname
#If you are using something aside from 192.168.1.0/24, change it.
awk 'BEGIN {N=203} {print "host exampleprefix" N " { hardware ethernet " $1 "; fixed-address 192.168.1." N "; option host-name \"exampleprefix" N "\"; }" ; N=N+1;  }' < example-mac
