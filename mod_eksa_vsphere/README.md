# eks_on_vsphere
## Example of calling this module

```terraform
module "eksa" {
  source       = "./module_eksa"
  cluster_name = "my_cluster_name"
  api_ip       = "10.40.105.172"
  cluster_size = "x-small"
  k8s_version  = "1.24"
  os_family    = "ubuntu"

  mgmt_cluster_name    = management_cluster_name
  ssh_keys_secret_name = ssh_keys_secret_name
  vcenter_server       = vcenter_server
  vsphere_datacenter   = vsphere_datacenter
  vsphere_network      = vsphere_network
  vsphere_resourcePool = vsphere_resourcePool
  vsphere_folder       = vsphere_folder
  vsphere_datastore    = vsphere_datastore

  tags = {
    "Env"       = ""
    "Owner"     = ""
    "consumers" = ""
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.58.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.18.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.58.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.18.1 |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tagger"></a> [tagger](#module\_tagger) | ../../aws/udemy_tagger | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.workload_kubeconfig](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.workload_kubeconfig](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [kubernetes_manifest.cluster_spec](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.cp_spec](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.dc_spec](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.etcd_spec](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.worker_spec](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [time_sleep.wait_for_cp_nodes](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_secretsmanager_secret.ssh_keys](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret.workload_kubeconfig](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.ssh_keys](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [kubernetes_secret.cluster_kubeconfig](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_ip"></a> [api\_ip](#input\_api\_ip) | Cluster endpoint API IP (Any unised IP from [10.40.105.172-200]. Best way to fetch is by ping or TCP 6443 check) | `string` | n/a | yes |
| <a name="input_bundle"></a> [bundle](#input\_bundle) | Distribution bundle for eks anywhere by AWS | `string` | `"bundles-26"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the new workload cluster | `string` | n/a | yes |
| <a name="input_cluster_size"></a> [cluster\_size](#input\_cluster\_size) | Cluster size | `string` | `"x-small"` | no |
| <a name="input_cp_diskGiB"></a> [cp\_diskGiB](#input\_cp\_diskGiB) | Disk size in GB for control plane nodes | `number` | `"25"` | no |
| <a name="input_cp_memoryMiB"></a> [cp\_memoryMiB](#input\_cp\_memoryMiB) | Memory in MB for control plane nodes | `number` | `"8192"` | no |
| <a name="input_cp_numCPUs"></a> [cp\_numCPUs](#input\_cp\_numCPUs) | CPUs for control plane nodes | `number` | `"2"` | no |
| <a name="input_etcd_count"></a> [etcd\_count](#input\_etcd\_count) | Number of etcd nodes | `number` | `"3"` | no |
| <a name="input_etcd_diskGiB"></a> [etcd\_diskGiB](#input\_etcd\_diskGiB) | Disk size in GB for etcd nodes | `number` | `"25"` | no |
| <a name="input_etcd_memoryMiB"></a> [etcd\_memoryMiB](#input\_etcd\_memoryMiB) | Memory in MB for etcd nodes | `number` | `"8192"` | no |
| <a name="input_etcd_numCPUs"></a> [etcd\_numCPUs](#input\_etcd\_numCPUs) | CPUs for etcd nodes | `number` | `"2"` | no |
| <a name="input_insecure"></a> [insecure](#input\_insecure) | True if vCenter endpoint URL has self-signed certs or insecure | `bool` | `true` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Cluster k8s version | `string` | `"1.24"` | no |
| <a name="input_mgmt_cluster_name"></a> [mgmt\_cluster\_name](#input\_mgmt\_cluster\_name) | Name of the management cluster | `string` | n/a | yes |
| <a name="input_os_family"></a> [os\_family](#input\_os\_family) | OS for Nodes | `string` | `"ubuntu"` | no |
| <a name="input_pod_cidr_block"></a> [pod\_cidr\_block](#input\_pod\_cidr\_block) | CIDR block for the pod network | `string` | `"192.168.0.0/16"` | no |
| <a name="input_ssh_keys_secret_name"></a> [ssh\_keys\_secret\_name](#input\_ssh\_keys\_secret\_name) | sshAuthorizedKeys to ssh into the nodes | `string` | n/a | yes |
| <a name="input_svc_cidr_block"></a> [svc\_cidr\_block](#input\_svc\_cidr\_block) | CIDR block for the services network | `string` | `"10.96.0.0/12"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags for the AWS Secret | `map(string)` | n/a | yes |
| <a name="input_thumbprint"></a> [thumbprint](#input\_thumbprint) | Thumbprint of the vCenter server | `string` | `null` | no |
| <a name="input_vcenter_server"></a> [vcenter\_server](#input\_vcenter\_server) | FQDN of the VA2 vCenter endpoint | `string` | n/a | yes |
| <a name="input_vsphere_datacenter"></a> [vsphere\_datacenter](#input\_vsphere\_datacenter) | Name of the vSphere Datacenter object in vCenter | `string` | n/a | yes |
| <a name="input_vsphere_datastore"></a> [vsphere\_datastore](#input\_vsphere\_datastore) | Name of the vSphere Datastore for node VMs | `string` | n/a | yes |
| <a name="input_vsphere_folder"></a> [vsphere\_folder](#input\_vsphere\_folder) | Name of the vSphere Folder for nodes | `string` | n/a | yes |
| <a name="input_vsphere_network"></a> [vsphere\_network](#input\_vsphere\_network) | Name of the vSphere Network to connect the nodes | `string` | n/a | yes |
| <a name="input_vsphere_resourcePool"></a> [vsphere\_resourcePool](#input\_vsphere\_resourcePool) | Name of the vSphere Resource pool for nodes | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig_secret"></a> [kubeconfig\_secret](#output\_kubeconfig\_secret) | Secret details containing kubeconfig of workload cluster |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
