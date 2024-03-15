terraform {
  cloud {
    organization = "Tech_Challenge_Fiap_G31"

    workspaces {
      name = "tech-challenge-app"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "fiaptc_sg" {
  vpc_id      = var.vpc_id
  name        = "fiaptc"
  description = "Allow all inbound for Postgres"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_db_instance" "fiaptc_db" {
  identifier             = "fiaptc-db"
  db_name                = "fiaptc_db"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "13"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.fiaptc_sg.id]
  username               = var.DB_USER
  password               = var.DB_PASSWORD
}
