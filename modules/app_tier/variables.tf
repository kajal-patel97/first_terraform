variable "vpc_id" {
  description = "the vpc id of which the app is launched"
}

variable "ig_id" {
  description = "the internet gateway id"
}

variable "app_name" {
  description = "tags"
}

variable "ami_id_app" {
  description = "ami_id"
}

variable "pub_ip" {
  description = "the generated ip"
}
