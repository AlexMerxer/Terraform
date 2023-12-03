resource "aws_security_group" "web_sg" {
  name        = var.websg_config.name
  description = var.websg_config.description
  vpc_id      = aws_vpc.My_ntier.id
  depends_on  = [aws_vpc.My_ntier]

}
resource "aws_security_group_rule" "Websg_Rules" {
  count             = length(var.websg_config.rules)
  security_group_id = aws_security_group.web_sg.id
  type              = var.websg_config.rules[count.index].type
  from_port         = var.websg_config.rules[count.index].from_port
  to_port           = var.websg_config.rules[count.index].to_port
  protocol          = var.websg_config.rules[count.index].protocol
  cidr_blocks       = [var.websg_config.rules[count.index].cidr_block]
  depends_on        = [aws_security_group.web_sg]

}
resource "aws_security_group" "db_sg" {
  name        = var.dbsg_config.name
  description = var.dbsg_config.description
  vpc_id      = aws_vpc.My_ntier.id
  depends_on  = [aws_vpc.My_ntier]

}
resource "aws_security_group_rule" "Dbsg_Rules" {
  count             = length(var.dbsg_config.rules)
  security_group_id = aws_security_group.db_sg.id
  type              = var.dbsg_config.rules[count.index].type
  from_port         = var.dbsg_config.rules[count.index].from_port
  to_port           = var.dbsg_config.rules[count.index].to_port
  protocol          = var.dbsg_config.rules[count.index].protocol
  cidr_blocks       = [var.dbsg_config.rules[count.index].cidr_block]
  depends_on        = [aws_security_group.db_sg]

}
resource "aws_security_group" "app_sg" {
  name        = var.appsg_config.name
  description = var.appsg_config.description
  vpc_id      = aws_vpc.My_ntier.id
  depends_on  = [aws_vpc.My_ntier]

}
resource "aws_security_group_rule" "Appsg_Rules" {
  count             = length(var.appsg_config.rules)
  security_group_id = aws_security_group.app_sg.id
  type              = var.appsg_config.rules[count.index].type
  from_port         = var.appsg_config.rules[count.index].from_port
  to_port           = var.appsg_config.rules[count.index].to_port
  protocol          = var.appsg_config.rules[count.index].protocol
  cidr_blocks       = [var.appsg_config.rules[count.index].cidr_block]
  depends_on        = [aws_security_group.app_sg]

}