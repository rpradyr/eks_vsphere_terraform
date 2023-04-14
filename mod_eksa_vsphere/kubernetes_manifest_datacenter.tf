resource "kubernetes_manifest" "dc_spec" {
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind"       = "VSphereDatacenterConfig"
    "metadata" = {
      "name"      = var.cluster_name
      "namespace" = "default"
    }
    "spec" = {
      "server"     = var.vcenter_server
      "insecure"   = var.insecure
      "datacenter" = var.vsphere_datacenter
      "network"    = var.vsphere_network
      "thumbprint" = var.thumbprint
    }
  }
}
