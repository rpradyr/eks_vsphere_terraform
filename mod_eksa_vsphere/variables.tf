variable "mgmt_cluster_name" {
  type        = string
  description = "Name of the management cluster"
}

variable "cluster_name" {
  type        = string
  description = "Name of the new workload cluster"
  validation {
    condition     = can(regex("[a-z0-9]([-a-z0-9]*[a-z0-9])?(.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*", var.cluster_name))
    error_message = "a lowercase RFC 1123 subdomain must consist of lower case alphanumeric characters, '-' or '.', and must start and end with an alphanumeric character (e.g. 'example.com')"
  }
}

variable "cluster_size" {
  type        = string
  description = "Cluster size"
  default     = "x-small"
  validation {
    condition     = contains(["x-small", "small", "medium", "large", "x-large"], var.cluster_size)
    error_message = "The cluster_size must be x-small, small, medium, large, or x-large."
  }
}

variable "api_ip" {
  type        = string
  description = "Cluster endpoint API IP (Any unised IP from [10.40.105.172-200]. Best way to fetch is by ping or TCP 6443 check)"
}

variable "k8s_version" {
  type        = string
  description = "Cluster k8s version"
  default     = "1.24"
}

variable "os_family" {
  type        = string
  description = "OS for Nodes"
  default     = "ubuntu"
  validation {
    condition     = contains(["ubuntu", "bottlerocket"], var.os_family)
    error_message = "The os_family must be ubuntu or bottlerocket"
  }
}

variable "ssh_keys_secret_name" {
  type        = string
  description = "sshAuthorizedKeys to ssh into the nodes"
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  description = "Resource tags for the AWS Secret"
}

variable "bundle" {
  type        = string
  description = "Distribution bundle for eks anywhere by AWS"
  default     = "bundles-26"
}

variable "pod_cidr_block" {
  type        = string
  description = "CIDR block for the pod network"
  default     = "192.168.0.0/16"
}

variable "svc_cidr_block" {
  type        = string
  description = "CIDR block for the services network"
  default     = "10.96.0.0/12"
}

variable "etcd_count" {
  type        = number
  description = "Number of etcd nodes"
  default     = "3"
}

variable "etcd_numCPUs" {
  type        = number
  description = "CPUs for etcd nodes"
  default     = "2"
}

variable "etcd_memoryMiB" {
  type        = number
  description = "Memory in MB for etcd nodes"
  default     = "8192"
}

variable "etcd_diskGiB" {
  type        = number
  description = "Disk size in GB for etcd nodes"
  default     = "25"
}

variable "cp_numCPUs" {
  type        = number
  description = "CPUs for control plane nodes"
  default     = "2"
}

variable "cp_memoryMiB" {
  type        = number
  description = "Memory in MB for control plane nodes"
  default     = "8192"
}

variable "cp_diskGiB" {
  type        = number
  description = "Disk size in GB for control plane nodes"
  default     = "25"
}

variable "vcenter_server" {
  type        = string
  description = "FQDN of the VA2 vCenter endpoint"
}

variable "insecure" {
  type        = bool
  description = "True if vCenter endpoint URL has self-signed certs or insecure"
  default     = true
}

variable "thumbprint" {
  type        = string
  description = "Thumbprint of the vCenter server"
  default     = null
}

variable "vsphere_datacenter" {
  type        = string
  description = "Name of the vSphere Datacenter object in vCenter"
}

variable "vsphere_network" {
  type        = string
  description = "Name of the vSphere Network to connect the nodes"
}

variable "vsphere_datastore" {
  type        = string
  description = "Name of the vSphere Datastore for node VMs"
}

variable "vsphere_resourcePool" {
  type        = string
  description = "Name of the vSphere Resource pool for nodes"
}

variable "vsphere_folder" {
  type        = string
  description = "Name of the vSphere Folder for nodes"
}
