output "kubeconfig_secret" {
  description = "Secret details containing kubeconfig of workload cluster"
  value = {
    aws_account_id = "602046956384"
    name           = data.aws_secretsmanager_secret.workload_kubeconfig.name
    tags           = data.aws_secretsmanager_secret.workload_kubeconfig.tags
  }
}
