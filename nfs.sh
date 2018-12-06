#!/bin/bash

#!/bin/bash

echo -n "Installing NFS by NocRoom.com ......";
yum install nfs-utils nfs-utils-lib nano -y >/dev/null 2>&1
echo -n "Installing auto boot for NFS  ......";
systemctl enable rpcbind >/dev/null 2>&1
systemctl enable nfs-server >/dev/null 2>&1
systemctl enable nfs-lock >/dev/null 2>&1
systemctl enable nfs-idmap >/dev/null 2>&1
systemctl start rpcbind >/dev/null 2>&1
systemctl start nfs-server >/dev/null 2>&1
systemctl start nfs-lock >/dev/null 2>&1
systemctl start nfs-idmap >/dev/null 2>&1
echo -n "Adjusting firewall settings ......";
systemctl disable firewalld >/dev/null 2>&1
systemctl stop firewalld >/dev/null 2>&1
echo -n "Creating/Adjusting Folder /home/nfs and editing /etc/exports ......";
mkdir /home/nfs
chmod 777 /home/nfs
echo "/home/nfs *(rw,sync,no_root_squash,no_all_squash)" >> /etc/exports
echo -n "Restarting Services ......";
service nfs restart >/dev/null 2>&1
echo -n "Installing all updates, this may take a few minutes ......";
yum update -y >/dev/null 2>&1
echo "All done. enjoy and please visit NocRoom.com for any server voip email colocation needs";
