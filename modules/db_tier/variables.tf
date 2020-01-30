variable "vpc_id" {
  description = "the internet gateway id"
}

variable "app_sg_id" {
  description = "sg from app"
}

variable "db_name" {
  description = "tags"
}

variable "ami_mongo_id" {
  description = "ami_mongo_id"
}

variable "ig_id" {
description = "the variable to interpolate the security group"
}
