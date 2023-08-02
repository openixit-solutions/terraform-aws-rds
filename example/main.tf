terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

data "aws_vpc" "default" {
  default = true
}

module "db_postgres" {
  source = "../"

  use_identifier_prefix = true
  identifier            = "openixtest"

  engine              = "postgres"
  engine_version      = "12.13"
  instance_class      = "db.t3.micro"
  publicly_accessible = true
  apply_immediately   = true

  db_name  = "testing"
  port     = 5432
  username = "openixtest"
  password = "supersecret"

  storage_encrypted = true
  storage_type      = "gp2"
  allocated_storage = 10

  performance_insights_enabled = true
  backup_retention_period      = 5
  backup_window                = "03:00-05:00"

  vpc_id = data.aws_vpc.default.id
  region = "us-west-2"

  cidr_blocks = ["181.81.214.132/32"]

  tags = {
    Name        = "openix_db"
    Environment = "test"
  }
}
