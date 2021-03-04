module "athena-users-group" {
  source = "./modules/groups"
}

module "athena" {
  source = "./athena"
}
