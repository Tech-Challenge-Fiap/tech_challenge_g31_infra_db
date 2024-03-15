variable "DB_PASSWORD" {
  type = string
}

variable "DB_USER" {
  type = string
}

variable "vpc_id" {
  description = "Private Subnet 1"
  default     = "vpc-0cc41e5c2f2bab408"
}