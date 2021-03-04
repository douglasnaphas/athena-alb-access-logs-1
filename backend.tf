terraform {
  required_version = "0.12.29"
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "douglasnaphas"

    workspaces {
      name = "athena-alb-access-logs-1"
    }
  }
}
