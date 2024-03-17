variable "DB_PASSWORD" {
  type = string
}

variable "DB_USER" {
  type = string
}

variable "vpc_id" {
  description = "VPC ID"
  default     = "vpc-0b136b343c5d5283b"
}


variable "subnets_ids" {
  default = ["subnet-00e3c8a2874e436aa", "subnet-0440edd530538d07f"]
}