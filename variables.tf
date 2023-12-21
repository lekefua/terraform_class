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
  default="philippe"
}

variable "cross_tenant_replication" {
  type=bool
  default=false
}

variable "account_tier"{
  type=string
  default="Standard"
}

variable "account_replication_type"{
  type=string
  default="GRS"
}

vaiable "resource_group"{
  type=string
  default="tf-rg-philippe"

}
