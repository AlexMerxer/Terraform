VPC_netwrok_Cidr = "10.10.0.0/16"
Subnet_Names     = ["Web_1", "Web_2", "App_1", "App_2", "Db_1", "Db_2"]
db_subnet_names  = ["Db_1", "Db_2"]
subnet_availabilityZones = ["us-west-2a", "us-west-2b", "us-west-2c",
  "us-west-2a", "us-west-2b", "us-west-2c",
  "us-west-2a", "us-west-2b", "us-west-2c",
]

websg_config = {
  name        = "websg"
  description = "This is web secuity group and its configaration"
  rules = [{
    type       = "ingress"
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    },
    {
      type       = "ingress"
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]


}
dbsg_config = {
  name        = "dbsg"
  description = "This is Db secuity group and its configaration"
  rules = [{
    type       = "ingress"
    from_port  = 3306
    to_port    = 3306
    protocol   = "tcp"
    cidr_block = "10.10.0.0/16"
    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]


}
appsg_config = {
  name        = "appsg"
  description = "this is appsecurity group"
  rules = [{
    type       = "ingress"
    from_port  = 8080
    to_port    = 8080
    protocol   = "tcp"
    cidr_block = "10.10.0.0/16"
    },
    {
      type       = "ingress"
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]


}