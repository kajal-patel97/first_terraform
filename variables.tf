variable "app_name" {
  type = string
  default = "Eng48-kajal-app"
}

variable "db_name" {
  type = string
  default = "Eng48-kajal-db"
}

variable "ami_id_app" {
  type = string
  default = "ami-0d8e5cfe85e85b81b"
}

#change ami to ur own

variable "ami_mongo_id" {
  type = string
  default = "ami-0eb937f4c95830907"
}
