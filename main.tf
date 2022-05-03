resource "aws_vpc_endpoint" "ssm" {
   for_each = toset(var.ssm_endpoints)

   vpc_id            = var.vpc_id
   service_name      = each.value
   vpc_endpoint_type = "Interface"
   subnet_ids        = var.subnets

   security_group_ids = [
     aws_security_group.ssm_sg.id,
   ]

   private_dns_enabled = var.private_dns_enabled

   tags = merge(
     {
     Name = "${each.value}"
   },
   var.tags
   )
 }

 resource "aws_security_group" "ssm_sg" {
   name        = "${var.prefix}_ssm_endpoint_security_group"
   description = "Allow HTTPS from VPC"
   vpc_id      = var.vpc_id

   ingress {
     description = "TLS from VPC"
     from_port   = 443
     to_port     = 443
     protocol    = "tcp"
     cidr_blocks = [var.vpc_cidr]
   }

   egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
   }

   tags = merge(
     {
     Name = "ssm_endpoint_security_group"
   },
   var.tags
   )
 }
