data "aws_secretsmanager_secret" "ssh_keys" {
  name = var.ssh_keys_secret_name
}
data "aws_secretsmanager_secret_version" "ssh_keys" {
  secret_id = data.aws_secretsmanager_secret.ssh_keys.id
}

data "kubernetes_secret" "cluster_kubeconfig" {
  depends_on = [time_sleep.wait_for_cp_nodes]
  metadata {
    name      = format("%s-kubeconfig", var.cluster_name)
    namespace = "eksa-system"
  }
}

data "aws_secretsmanager_secret" "workload_kubeconfig" {
  depends_on = [aws_secretsmanager_secret.workload_kubeconfig]
  name       = format("prod/eksa/%s_kubeconfig", var.cluster_name)
}
