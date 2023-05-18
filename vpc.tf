module "vpc_cloud" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.name_vpc_cloud
  cidr = local.vpc_cidr_cloud

  azs                 = local.azs_cloud
  private_subnets     = [for k, v in local.azs_cloud : cidrsubnet(local.vpc_cidr_cloud, 8, k)]
  public_subnets      = [for k, v in local.azs_cloud : cidrsubnet(local.vpc_cidr_cloud, 8, k + 4)]
  database_subnets    = [for k, v in local.azs_cloud : cidrsubnet(local.vpc_cidr_cloud, 8, k + 8)]
  
  private_subnet_names = ["cloud Private One", "cloud Private Two"]
  public_subnet_names = [" cloud public One", "cloud public Two"]
  # public_subnet_names omitted to show default name generation for all three subnets
  database_subnet_names    = ["cloud DB One","cloud DB two"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = local.tags
}


module "vpc_onprem" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.name_vpc_onprem
  cidr = local.vpc_cidr_onprem

  azs                 = local.azs_onprem
  private_subnets     = [for k, v in local.azs_onprem : cidrsubnet(local.vpc_cidr_onprem, 8, k)]
  public_subnets      = [for k, v in local.azs_onprem : cidrsubnet(local.vpc_cidr_onprem, 8, k + 4)]
  database_subnets    = [for k, v in local.azs_onprem : cidrsubnet(local.vpc_cidr_onprem, 8, k + 8)]
  
  private_subnet_names = ["onprem private One", "onprem Private  Two"]
  public_subnet_names = ["onprem public One", "onprem public Two"]
  # public_subnet_names omitted to show default name generation for all three subnets
  database_subnet_names    = ["onprem DB One", "onprem DB two"]

  enable_nat_gateway = false

  tags = local.tags
}
