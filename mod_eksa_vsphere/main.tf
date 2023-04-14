locals {
  template = {
    "ubuntu" = {
      "1.23" = "/va2-datacenter/vm/EKSA-NodeImages/Ubuntu_ova/ubuntu-2004-kube-v1.23.16",
      "1.24" = "/va2-datacenter/vm/EKSA-NodeImages/Ubuntu_ova/ubuntu-2004-kube-v1.24.10"
    }
    "bottlerocket" = {
      "1.23" = "/va2-datacenter/vm/EKSA-NodeImages/Bottlerocket_ova/bottlerocket-vmware-k8s-1.23-x86_64-1.10.0-3949354b",
      "1.24" = "/va2-datacenter/vm/EKSA-NodeImages/Bottlerocket_ova/bottlerocket-vmware-k8s-1.24-x86_64-1.10.1-5d27ae74"
    }
  }
  numCPUs = {
    "x-small" = 2,
    "small"   = 2,
    "medium"  = 4,
    "large"   = 8,
    "x-large" = 8
  }
  memoryMiB = {
    "x-small" = 4096,
    "small"   = 4096,
    "medium"  = 8192,
    "large"   = 16384,
    "x-large" = 16384
  }
  diskGiB = {
    "x-small" = 25,
    "small"   = 25,
    "medium"  = 25,
    "large"   = 50,
    "x-large" = 50
  }
  cp_count = {
    "x-small" = 1,
    "small"   = 2,
    "medium"  = 3,
    "large"   = 3,
    "x-large" = 3
  }
  worker_count = {
    "x-small" = 1,
    "small"   = 3,
    "medium"  = 5,
    "large"   = 5,
    "x-large" = 7
  }

  sshUser        = var.os_family == "ubuntu" ? "udemy-breakglass" : "ec2-user"
  validated_tags = module.tagger.output_tags
}

module "tagger" {
  source = "../../aws/udemy_tagger"
  input_tags = {
    Name        = ""
    Owner       = can(lookup(var.tags, "Owner")) ? var.tags["Owner"] : "InfraEng"
    consumers   = can(lookup(var.tags, "consumers")) ? var.tags["consumers"] : "InfraEng"
    cluster     = var.cluster_name
    role        = "eks_anywhere"
    environment = var.tags["Env"]
    Env         = var.tags["Env"]
  }
}
