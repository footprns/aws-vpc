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

module "sales-subnet-internet" {
  source = "./modules/subnet"
  name = "sales-subnet-internet"
  vpc_id = module.sales-vpc.id
  cidr_block = "192.168.0.128/25"
  availability_zone = "ap-southeast-1a"
}
