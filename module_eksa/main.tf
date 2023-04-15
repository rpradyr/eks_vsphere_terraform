locals {
  template = {
    "ubuntu" = {
      "1.23" = "/vsphere_datacenter/vm/template_path/template_name", #change me
      "1.24" = "/vsphere_datacenter/vm/template_path/template_name"  #change me
    }
    "bottlerocket" = {
      "1.23" = "/vsphere_datacenter/vm/template_path/template_name", #change me
      "1.24" = "/vsphere_datacenter/vm/template_path/template_name"  #change me
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
}
