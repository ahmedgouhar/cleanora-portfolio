resource "aws_security_group" "web_sg" {
  name   = "cleanora-web-sg"
  vpc_id = var.vpc_id
}
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}
resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.main.id

#   tags = {
#     Name = "allow_tls"
#   }
# }

# resource "aws_security_group" "app" {
#   name   = "cleanora-app-sg"
#   vpc_id = var.vpc_id
# }
# resource "aws_vpc_security_group_ingress_rule" "app_from_web" {
#   security_group_id            = aws_security_group.app.id
#   referenced_security_group_id = var.web_sg_id
#   from_port                    = 8080
#   to_port                      = 8080
#   ip_protocol                  = "tcp"
# }

# resource "aws_security_group" "db" {
#   name   = "cleanora-db-sg"
#   vpc_id = var.vpc_id
# }
# resource "aws_vpc_security_group_ingress_rule" "db_from_app" {
#   security_group_id            = aws_security_group.db.id
#   referenced_security_group_id = var.app_sg_id
#   from_port                    = 3306
#   to_port                      = 3306
#   ip_protocol                  = "tcp"
# }











# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1"
# }

  