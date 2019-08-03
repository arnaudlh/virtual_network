
# locals {
#   subnet_keys = values(var.subnets)[*].name

#   item_to_remove_from_nsg = var.subnets_to_exclude

#   list_with_item_in_front = distinct(concat(local.item_to_remove_from_nsg, local.subnet_keys))

#   subnet_list = slice(local.list_with_item_in_front, 1, length(local.list_with_item_in_front))
# }