data "aws_caller_identity" "current" {}

# RDS PROXY CONFIGS

resource "aws_db_proxy" "rdsproxy" {

  name                   = var.proxy_name
  debug_logging          = false
  engine_family          = var.engine_family
  idle_client_timeout    = 180
  require_tls            = true
  role_arn               = "arn:aws:iam::975635808270:role/AdminAccess"
  vpc_security_group_ids = var.vpc_security_group_ids
  vpc_subnet_ids         = var.vpc_subnet_ids

  auth {
    auth_scheme = "SECRETS"
    description = "Conection with Secret Manager"
    iam_auth = "DISABLED"
    secret_arn = var.secret_arn
  }
}

resource "aws_db_proxy_default_target_group" "rdsproxy_tg" {
  
  db_proxy_name = aws_db_proxy.rdsproxy.name
  
  connection_pool_config {
    connection_borrow_timeout = 180
    max_connections_percent   = 100
    max_idle_connections_percent = 20
  }
}

resource "aws_db_proxy_target" "rdsproxy_target" {
  db_proxy_name = aws_db_proxy.rdsproxy.name
  target_group_name = aws_db_proxy_default_target_group.rdsproxy_tg.name
  db_instance_identifier = var.db_instance_identifier
  db_cluster_identifier = var.db_cluster_identifier
}

resource "aws_db_proxy_endpoint" "rds_endpoint" {

  db_proxy_name = aws_db_proxy.rdsproxy.name

  db_proxy_endpoint_name = var.endpoint_name

  vpc_security_group_ids = var.vpc_security_group_ids

  vpc_subnet_ids = var.vpc_subnet_ids

  target_role = "READ_WRITE"

}
