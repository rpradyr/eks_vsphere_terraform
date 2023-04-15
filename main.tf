module "w01-blog-demo" {
  source       = "module_eksa"
  cluster_name = ""
  api_ip       = ""
  cluster_size = ""
  k8s_version  = ""
  os_family    = ""

  mgmt_cluster_name    = var.mgmt_cluster_name
  sshAuthorizedKeys    = var.sshAuthorizedKeys_secret_name
  vcenter_server       = var.vcenter_server
  vsphere_datacenter   = var.vsphere_datacenter
  vsphere_network      = var.vsphere_network
  vsphere_resourcePool = var.vsphere_resourcePool
  vsphere_folder       = var.vsphere_folder
  vsphere_datastore    = var.vsphere_datastore

  secret_tags = {
    "key1" = "value1"
    "key2" = "value2"
  }
}

