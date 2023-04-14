resource "kubernetes_manifest" "cluster_mgmt-cluster" {
  computed_fields = ["metadata.generated"]
  field_manager {
    force_conflicts = true
  }
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind" = "Cluster"
    "metadata" = {
      "name" = "mgmt-cluster"
      "namespace" = "default"
    }
    "spec" = {
      "bundlesRef" = {
        "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
        "name" = "bundles-26"
        "namespace" = "eksa-system"
      }
      "clusterNetwork" = {
        "cniConfig" = {
          "cilium" = {}
        }
        "pods" = {
          "cidrBlocks" = [
            "192.168.0.0/16",
          ]
        }
        "services" = {
          "cidrBlocks" = [
            "10.96.0.0/12",
          ]
        }
      }
      "controlPlaneConfiguration" = {
        "count" = 3
        "endpoint" = {
          "host" = "172.16.10.2"
        }
        "machineGroupRef" = {
          "kind" = "VSphereMachineConfig"
          "name" = "mgmt-cluster-cp"
        }
      }
      "datacenterRef" = {
        "kind" = "VSphereDatacenterConfig"
        "name" = "mgmt-cluster"
      }
      "externalEtcdConfiguration" = {
        "count" = 3
        "machineGroupRef" = {
          "kind" = "VSphereMachineConfig"
          "name" = "mgmt-cluster-etcd"
        }
      }
      "kubernetesVersion" = "1.24"
      "managementCluster" = {
        "name" = "mgmt-cluster"
      }
      "workerNodeGroupConfigurations" = [
        {
          "count" = 3
          "machineGroupRef" = {
            "kind" = "VSphereMachineConfig"
            "name" = "mgmt-cluster"
          }
          "name" = "worker"
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "dc_mgmt-cluster" {
  computed_fields = ["metadata.generated"]
  field_manager {
    force_conflicts = true
  }
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind" = "VSphereDatacenterConfig"
    "metadata" = {
      "name" = "mgmt-cluster"
      "namespace" = "default"
    }
    "spec" = {
      "datacenter" = "vsphere_datacenter"
      "insecure" = true
      "network" = "/vsphere_datacenter/network/network_name"
      "server" = "vcenter_fqdn"
      "thumbprint" = ""
    }
  }
}

resource "kubernetes_manifest" "cp_mgmt-cluster" {
  computed_fields = ["metadata.generated"]
  field_manager {
    force_conflicts = true
  }
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind" = "VSphereMachineConfig"
    "metadata" = {
     "name" = "mgmt-cluster-cp"
     "namespace" = "default"
   }
    "spec" = {
      "datastore" = "/vsphere_datacenter/datastore/datastore_name"
      "diskGiB" = 25
      "folder" = "/vsphere_datacenter/vm/folder_name"
      "memoryMiB" = 8192
      "numCPUs" = 2
      "osFamily" = "bottlerocket"
      "resourcePool" = "/vsphere_datacenter/host/cluster_name/Resources/resourcepool_name"
      "template" = "/vsphere_datacenter/vm/template_path/template_name"
      "users" = [
        {
          "name" = "ec2-user"
          "sshAuthorizedKeys" = [
            "ssh-rsa AAAA...",
          ]
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "etcd_mgmt-cluster" {
  computed_fields = ["metadata.generated"]
  field_manager {
    force_conflicts = true
  }
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind" = "VSphereMachineConfig"
    "metadata" = {
     "name" = "mgmt-cluster-etcd"
     "namespace" = "default"
   }
    "spec" = {
      "datastore" = "/vsphere_datacenter/datastore/datastore_name"
      "diskGiB" = 25
      "folder" = "/vsphere_datacenter/vm/folder_name"
      "memoryMiB" = 8192
      "numCPUs" = 2
      "osFamily" = "bottlerocket"
      "resourcePool" = "/vsphere_datacenter/host/cluster_name/Resources/resourcepool_name"
      "template" = "/vsphere_datacenter/vm/template_path/template_name"
      "users" = [
        {
          "name" = "ec2-user"
          "sshAuthorizedKeys" = [
            "ssh-rsa AAAA...",
          ]
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "worker_mgmt-cluster" {
  computed_fields = ["metadata.generated"]
  field_manager {
    force_conflicts = true
  }
  manifest = {
    "apiVersion" = "anywhere.eks.amazonaws.com/v1alpha1"
    "kind" = "VSphereMachineConfig"
    "metadata" = {
     "name" = "mgmt-cluster"
     "namespace" = "default"
   }
    "spec" = {
      "datastore" = "/vsphere_datacenter/datastore/datastore_name"
      "diskGiB" = 25
      "folder" = "/vsphere_datacenter/vm/folder_name"
      "memoryMiB" = 8192
      "numCPUs" = 2
      "osFamily" = "bottlerocket"
      "resourcePool" = "/vsphere_datacenter/host/cluster_name/Resources/resourcepool_name"
      "template" = "/vsphere_datacenter/vm/template_path/template_name"
      "users" = [
        {
          "name" = "ec2-user"
          "sshAuthorizedKeys" = [
            "ssh-rsa AAAA...",
          ]
        },
      ]
    }
  }
}
