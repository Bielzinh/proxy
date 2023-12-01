variable proxy_name {
  type        = string
  default     = "proxy-test"
  description = "description"
}

variable engine_family {
  type        = string
  default     = "MYSQL"
  description = "description"
}

variable vpc_security_group_ids {
  type        = list
  default     = ["sg-0d78689315ff00ae3"]
  description = "description"
}

variable vpc_subnet_ids {
  type        = list
  default     = ["subnet-0807fd8c6bdfb7d2b", "subnet-086118b07bc20a940"]
  description = "description"
}

variable secret_arn {
  type        = string
  default     = "arn:aws:secretsmanager:us-east-2:975635808270:secret:proxy-qFa1kd"
  description = "description"
}

variable db_instance_identifier {
  type        = string
  default     = null
  description = "description"
}

variable db_cluster_identifier {
  type        = string
  default     = null
  description = "description"
}

variable endpoint_name {
  type        = string
  default     = "proxy-test"
  description = "description"
}








