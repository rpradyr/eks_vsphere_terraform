aws_account = ""
role        = ""
region      = ""

mgmt_cluster_ip   = "172.16.10.2"
mgmt_cluster_name = "mgmt-cluster"

mgmtclu_client-certificate-data_secret_name    = "prod/eksa/client-certificate-data"
mgmtclu_client-key-data_secret_name            = "prod/eksa/client-key-data"
mgmtclu_certificate-authority-data_secret_name = "prod/eksa/certificate-authority-data"
sshAuthorizedKeys_secret_name                  = "prod/eksa/sshAuthorizedKeys"

vcenter_server       = "vcenter_fqdn"
vsphere_datacenter   = "vsphere_datacenter"
vsphere_network      = "/vsphere_datacenter/network/network_name"
vsphere_resourcePool = "/vsphere_datacenter/host/cluster_name/Resources/resourcepool_name"
vsphere_folder       = "/vsphere_datacenter/vm/folder_name"
vsphere_datastore    = "/vsphere_datacenter/datastore/datastore_name"


