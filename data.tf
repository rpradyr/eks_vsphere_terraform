data "aws_secretsmanager_secret" "client_cert" {
  name = var.mgmtclu_client-certificate-data_secret_name
}
data "aws_secretsmanager_secret_version" "client_cert" {
  secret_id = data.aws_secretsmanager_secret.client_cert.id
}


data "aws_secretsmanager_secret" "client_key" {
  name = var.mgmtclu_client-key-data_secret_name
}
data "aws_secretsmanager_secret_version" "client_key" {
  secret_id = data.aws_secretsmanager_secret.client_key.id
}


data "aws_secretsmanager_secret" "cluster_ca_cert" {
  name = var.mgmtclu_certificate-authority-data_secret_name
}
data "aws_secretsmanager_secret_version" "cluster_ca_cert" {
  secret_id = data.aws_secretsmanager_secret.cluster_ca_cert.id
}

