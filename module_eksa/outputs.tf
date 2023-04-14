output "kubeconfig_secret" {
  description = "Secret details containing kubeconfig of workload cluster"
  value = {
    name = data.aws_secretsmanager_secret.workload_kubeconfig.name
    arn  = data.aws_secretsmanager_secret.workload_kubeconfig.arn
    tags = data.aws_secretsmanager_secret.workload_kubeconfig.tags
  }
}
