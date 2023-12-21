variable "subscription_id"{
  type=string
}

variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}

variable "object_id"{
  type=string
}

variable "db_password"{
  type=string
}

variable "db_user"{
  type=string
}

variable "countNumber"{
  type=number
  default=0
}

variable "MyName" {
  type=string
  default=philippe
}

variable "cross_tenant_replication_enabled" {
  type=boolean
  default=false
}
