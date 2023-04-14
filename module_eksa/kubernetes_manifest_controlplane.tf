resource "kubernetes_manifest" "cp_spec" {
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind"       = "VSphereMachineConfig"
    "metadata" = {
      "name"      = format("%s-cp", var.cluster_name)
      "namespace" = "default"
    }
    "spec" = {
      "datastore"    = var.vsphere_datastore
      "diskGiB"      = var.cp_diskGiB
      "folder"       = var.vsphere_folder
      "memoryMiB"    = var.cp_memoryMiB
      "numCPUs"      = var.cp_numCPUs
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


resource "time_sleep" "wait_for_cp_nodes" {
  depends_on      = [kubernetes_manifest.cp_spec]
  create_duration = "150s"
}
