variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "asterra-assignment"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "db_username" {
  default = "postgres"
}

variable "db_password" {
  default = "LiamSecurePass2025!"
  sensitive = true
}

variable "db_name" {
  default = "gisdb"
}

variable "db_allocated_storage" {
  default = 20
}




