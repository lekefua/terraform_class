locals {​

  service_name = "forum"​
  owner        = "Community Team"​
}​

Output variables Example:​

output "print"{​
      value = local.service_name​
}​

output "secondprint"{​
      value = local.owner​

}
