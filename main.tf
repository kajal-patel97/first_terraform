# Set a provider
provider "aws" {
  region = "eu-west-1"
}

# Creating a VPC
resource "aws_vpc" "app_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.app_name
  }
}

#Internet Gateway
resource "aws_internet_gateway" "app_gw" {
  vpc_id = aws_vpc.app_vpc.id
  tags = {
    Name = var.app_name
  }
}




# Call module to create app tier
module "app" {
  source = "./modules/app_tier"
  vpc_id = aws_vpc.app_vpc.id
  ig_id = aws_internet_gateway.app_gw.id
  app_name = var.app_name
  ami_id_app = var.ami_id_app
  pub_ip = module.db.pub_ip
}


# Call module to create db_tier
module "db" {
  source = "./modules/db_tier"
  vpc_id = aws_vpc.app_vpc.id
  ig_id = aws_internet_gateway.app_gw.id
  db_name = var.db_name
  app_sg_id = module.app.app_sg_id
  ami_mongo_id = var.ami_mongo_id
}
