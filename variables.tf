variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "subnets_cidr" {
	type = "list"
	default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "availability_zones" {
	type = "list"
	default = ["us-east-1a", "us-east-1b"]
}

# Environment variable TF_VAR_db_password needs to be set
variable "db_password" {
    type = "string"
    default = "password"
}