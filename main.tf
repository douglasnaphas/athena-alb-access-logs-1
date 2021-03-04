module "athena-users-group" {
  source = "./modules/groups"
}

module "athena" {
  source = "./modules/athena"
}
