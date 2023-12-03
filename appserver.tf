resource "aws_key_pair" "privateKeyPair" {
  key_name   = "MyPK"
  public_key = file(var.Public_key)
  tags = {
    CreatedBy = "Terraform"
  }
}
data "aws_subnet" "app" {
  filter {
    name   = "tag:Name"
    values = [var.app_subnet_name]
  }

  depends_on = [aws_subnet.Subnets]
}
resource "aws_instance" "AppServer" {
  ami                         = var.ami_Id
  associate_public_ip_address = true
  instance_type               = var.Ec2_instance_Size
  key_name                    = aws_key_pair.privateKeyPair.key_name
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  subnet_id                   = data.aws_subnet.app.id
  tags = {
    Name = "App_serverInstance"
  }


  depends_on = [
    aws_subnet.Subnets,
  aws_db_instance.my_ntier_db]
}