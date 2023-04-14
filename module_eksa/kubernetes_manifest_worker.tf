resource "kubernetes_manifest" "worker_spec" {
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind"       = "VSphereMachineConfig"
    "metadata" = {
      "name"      = var.cluster_name
      "namespace" = "default"
    }
    "spec" = {
      "datastore"    = var.vsphere_datastore
      "diskGiB"      = local.diskGiB[var.cluster_size]
      "folder"       = var.vsphere_folder
      "memoryMiB"    = local.memoryMiB[var.cluster_size]
      "numCPUs"      = local.numCPUs[var.cluster_size]
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
