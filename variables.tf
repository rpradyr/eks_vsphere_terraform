#AWS account details to Read/Write secret data
variable "aws_account" {
  type        = string
  description = "AWS account ID to Read/Write secret data"
}
variable "role" {
  type        = string
  description = "AWS role to authenticate"
}
variable "region" {
  description = "AWS region to Read/Write secret data"
}

variable "mgmt_cluster_name" {}
variable "mgmt_cluster_ip" {}

variable "mgmtclu_client-certificate-data_secret_name" {}
variable "mgmtclu_client-key-data_secret_name" {}
variable "mgmtclu_certificate-authority-data_secret_name" {}
variable "sshAuthorizedKeys_secret_name" {}

variable "vcenter_server" {}
variable "vsphere_datacenter" {}
variable "vsphere_network" {}
variable "vsphere_resourcePool" {}
variable "vsphere_folder" {}
variable "vsphere_datastore" {}

