source ~/.bash_profile
$net_id=
$availability_zone=
nova boot --image "#{image_name}" --flavor "#{flavor_name}" --nic net-id="#{net_id}" --availability-zone "#{availability_zone}":"#{hypervisor}" "#{instance_name}"