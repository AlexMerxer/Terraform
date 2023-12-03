// Create Db subnet group

data "aws_subnets" "Db_subNames" {
  filter {
    name   = "tag:Name"
    values = var.db_subnet_names
  }
  depends_on = [aws_subnet.Subnets]
}
resource "aws_db_subnet_group" "my_Db_subGrps" {
  name       = "my_dbsubgrp"
  subnet_ids = data.aws_subnets.Db_subNames.ids
  tags = {
    Name = "My_VPC_DbSubgrp"
  }
  depends_on = [
    aws_subnet.Subnets,
    data.aws_subnets.Db_subNames
  ]
}
//ami_Id=ami-03f65b8614a860c29
resource "aws_db_instance" "my_ntier_db" {
  allocated_storage      = 20
  db_name                = "my_Rds"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "Sonuzz"
  password               = "rootroot"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.my_Db_subGrps.name
  identifier             = "ntierarchdb"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  depends_on = [aws_db_subnet_group.my_Db_subGrps,
    aws_vpc.My_ntier,
    aws_subnet.Subnets
  ]
}
