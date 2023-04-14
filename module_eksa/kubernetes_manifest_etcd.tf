resource "kubernetes_manifest" "etcd_spec" {
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind"       = "VSphereMachineConfig"
    "metadata" = {
      "name"      = format("%s-etcd", var.cluster_name)
      "namespace" = "default"
    }
    "spec" = {
      "datastore"    = var.vsphere_datastore
      "diskGiB"      = var.etcd_diskGiB
      "folder"       = var.vsphere_folder
      "memoryMiB"    = var.etcd_memoryMiB
      "numCPUs"      = var.etcd_numCPUs
      "osFamily"     = var.os_family
      "resourcePool" = var.vsphere_resourcePool
      "template"     = local.template[var.os_family][var.k8s_version]
      "users" = [
        {
          "name"              = local.sshUser
          "sshAuthorizedKeys" = [data.aws_secretsmanager_secret_version.ssh_keys.secret_string]
        },
      ]
    }
  }
}
