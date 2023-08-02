resource "aws_security_group" "this" {
  description = "Default security group of the database"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "inbound_traffic_cidr" {
  count = length(var.cidr_blocks) > 0 ? 1 : 0

  description       = "inbound traffic database"
  security_group_id = aws_security_group.this.id

  type        = "ingress"
  from_port   = var.port
  to_port     = var.port
  protocol    = "tcp"
  cidr_blocks = var.cidr_blocks
}

resource "aws_security_group_rule" "inbound_traffic" {
  for_each = toset(var.security_group_blocks)

  description       = "inbound traffic database"
  security_group_id = aws_security_group.this.id

  type                     = "ingress"
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "tcp"
  source_security_group_id = each.value
}

resource "aws_security_group_rule" "outbound_traffic" {
  description       = "outbound traffic database"
  security_group_id = aws_security_group.this.id

  type        = "egress"
  from_port   = -1
  to_port     = -1
  protocol    = -1
  cidr_blocks = ["0.0.0.0/0"]
}
