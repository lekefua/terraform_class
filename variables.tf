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
  default="mybutt"
}

variable "cross_tenant_replication" {
  type=bool
  default=false
}

variable "account_tier"{
  type=string
}

variable "account_replication_type"{
  type=string
}

variable "resource_group"{
  type=string

}

variable "pieces"{
  type=list
  default = [turbo, coilovers, exhaust manifold, carburator]

}

variable "environment"{
  type=string
  default="dev-only"
}
