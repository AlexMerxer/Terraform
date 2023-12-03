variable "VPC_netwrok_Cidr" {
  type        = string
  description = "This is netwrok range for VPC"

}
variable "db_subnet_names" {
  type        = list(string)
  description = "These are my Database subnet names"
}
variable "subnet_availabilityZones" {
  type        = list(string)
  description = "This tells the Availability zones of the Database"
}
variable "Subnet_Names" {
  type        = list(string)
  description = "Names Of different Subnets"
}
variable "websg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "This is web Security Group Config"
}
variable "appsg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "This is App Security Group Config"
}
variable "dbsg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "This is db Security Group Config"
}
variable "Public_key" {
  type    = string
  default = "C:/Users/nayee/.ssh/id_rsa.pub"
}
variable "ami_Id" {
  type    = string
  default = "ami-03f65b8614a860c29"
}
variable "Ec2_instance_Size" {
  type    = string
  default = "t2.micro"
}
variable "app_subnet_name" {
  type    = string
  default = "App_1"
}
