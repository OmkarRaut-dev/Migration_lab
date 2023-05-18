locals {
  name_vpc_cloud   = "cloud-vpc"
  name_vpc_onprem   = "onprem-vpc"

  region = "eu-central-1"

  vpc_cidr_cloud = "10.0.0.0/16"
  vpc_cidr_onprem ="192.168.0.0/16"
  azs_cloud      = slice(data.aws_availability_zones.available.names, 0, 2)
  azs_onprem     = slice(data.aws_availability_zones.available.names, 0, 2)

  tags = {
    Example    = local.name_vpc_cloud
    Example    = local.name_vpc_onprem
    GithubRepo = "terraform-aws-vpc"
    GithubOrg  = "terraform-aws-modules"
  }
}
