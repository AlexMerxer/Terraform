resource "aws_vpc" "My_ntier" {
  cidr_block = var.VPC_netwrok_Cidr
  tags = {
    Name = local.Name
  }
}
resource "aws_subnet" "Subnets" {
  count             = length(var.Subnet_Names)
  vpc_id            = aws_vpc.My_ntier.id
  cidr_block        = cidrsubnet(var.VPC_netwrok_Cidr, 8, count.index)
  availability_zone = var.subnet_availabilityZones[count.index]
  tags = {
    Name = var.Subnet_Names[count.index]
  }
  depends_on = [aws_vpc.My_ntier]
}
data "aws_route_table" "default" {
  vpc_id = aws_vpc.My_ntier.id
  depends_on = [
    aws_vpc.My_ntier
  ]
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.My_ntier.id
  tags = {
    Name = "My_ntier_igw"
  }
  depends_on = [aws_vpc.My_ntier]
}
resource "aws_route" "My_igw_route" {
  route_table_id         = data.aws_route_table.default.id
  destination_cidr_block = local.anywhere
  gateway_id             = aws_internet_gateway.igw.id

  depends_on = [
    aws_vpc.My_ntier,
    aws_internet_gateway.igw
  ]
}