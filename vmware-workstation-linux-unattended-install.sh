#!/bin/bash

#not tested on workstation 11 or 12

if [ ! -d /usr/lib/vmware ]
then
/bin/stty rows 10000
/home/INSTALL/VMware-Workstation-Full-10.0.1-1379776.x86_64.bundle --required --console <<EOF
\n
yes
\n
yes
EOF

/usr/lib/vmware/bin/vmware-vmx --new-sn YOUR1-SN111-GOES1-HERE1-11111
fi
