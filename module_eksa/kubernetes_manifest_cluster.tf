resource "kubernetes_manifest" "cluster_spec" {
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind"       = "Cluster"
    "metadata" = {
      "name"      = var.cluster_name
      "namespace" = "default"
    }
    "spec" = {
      "bundlesRef" = {
        "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
        "name"       = var.bundle
        "namespace"  = "eksa-system"
      }
      "clusterNetwork" = {
        "cniConfig" = {
          "cilium" = {}
        }
        "dns" = {}
        "pods" = {
          "cidrBlocks" = [
            var.pod_cidr_block,
          ]
        }
        "services" = {
          "cidrBlocks" = [
            var.svc_cidr_block,
          ]
        }
      }
      "controlPlaneConfiguration" = {
        "count" = local.cp_count[var.cluster_size]
        "endpoint" = {
          "host" = var.api_ip
        }
        "machineGroupRef" = {
          "kind" = "VSphereMachineConfig"
          "name" = format("%s-cp", var.cluster_name)
        }
      }
      "datacenterRef" = {
        "kind" = "VSphereDatacenterConfig"
        "name" = var.cluster_name
      }
      "externalEtcdConfiguration" = {
        "count" = var.etcd_count
        "machineGroupRef" = {
          "kind" = "VSphereMachineConfig"
          "name" = format("%s-etcd", var.cluster_name)
        }
      }
      "kubernetesVersion" = var.k8s_version
      "managementCluster" = {
        "name" = var.mgmt_cluster_name
      }
      "workerNodeGroupConfigurations" = [
        {
          "count" = local.worker_count[var.cluster_size]
          "machineGroupRef" = {
            "kind" = "VSphereMachineConfig"
            "name" = var.cluster_name
          }
          "name" = "worker"
        },
      ]
    }
  }
}
