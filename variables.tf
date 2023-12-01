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
  default     = ["sg-0cbb1b3d57f47c3fd"]
  description = "description"
}

variable vpc_subnet_ids {
  type        = list
  default     = ["subnet-0182ff33d73992d13", "subnet-039862627d3503915"]
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








