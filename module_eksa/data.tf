data "aws_secretsmanager_secret" "sshAuthorizedKeys" {
  name = var.sshAuthorizedKeys
}
data "aws_secretsmanager_secret_version" "sshAuthorizedKeys" {
  secret_id = data.aws_secretsmanager_secret.sshAuthorizedKeys.id
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
