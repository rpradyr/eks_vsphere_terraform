resource "aws_secretsmanager_secret" "workload_kubeconfig" {
  name = format("prod/eksa/%s_kubeconfig", var.cluster_name)
  tags = merge(local.validated_tags, { Name = format("prod/eksa/%s_kubeconfig", var.cluster_name) })
}

resource "aws_secretsmanager_secret_version" "workload_kubeconfig" {
  secret_id     = aws_secretsmanager_secret.workload_kubeconfig.id
  secret_string = data.kubernetes_secret.cluster_kubeconfig.data["value"]
}
