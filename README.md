PrivateCloud
============

Openstack enabled IaaS

Image Creation
===============
For VMWare:
set the following options while uploading vmdk
--property vmware_disktype=""
--property vmware_adaptertype=""

glance image-create --name centos-6.5-mini --is-public=True --container-format=bare --disk-format=vmdk --property vmware_disktype="sparse" --property vmware_adaptertype="ide" < centos-6.5-mini.vmdk
