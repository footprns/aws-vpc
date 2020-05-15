module "sales-vpc" {
  source = "./modules/vpc"
  name = "sales-vpc"
  cidr_block = "192.168.0.0/24"
}

module "sales-subnet" {
  source = "./modules/subnet"
  name = "sales-subnet"
  vpc_id = module.sales-vpc.id
  cidr_block = "192.168.0.0/25"
  availability_zone = "ap-southeast-1a"
}

module "intenet-to-sales" {
  source = "./modules/route"
  # route_table_id = "rtb-0157970ac3f4036ed"
  route_table_id = module.sales-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  vpc_peering_connection_id = null
  gateway_id = module.intenet-gateway-sales.id
}