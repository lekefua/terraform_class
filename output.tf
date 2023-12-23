output "Team_Name"{
  value = local.service_name

}
output "Stadium"{
    value = local.owner

}
output "Number_of_characters_in_the_team_name"{
  value = local.lengthofservice_name

}
output "Number_of_characters_in_the_Stadium_name"{
  value = local.lengthofowner

}

output "Number_of_spare_gloves_at_the_field"{
  value = local.spare_gloves
}

output "pointless_output"{
  value = local.lengthofspare_gloves
}

output "some_number"{
  value = var.countNumber
}

output "pieces_list"{
  value = var.pieces
}

output "staging_environment"{
  value = var.environment
}

output "List_of_winter_sports"{
  value = local.winter_sports_list
}

output "loop_output"{
	value=[for xyz in local.winter_sports_list:sport]
}
