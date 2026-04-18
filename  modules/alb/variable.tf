variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "sg_id" {}
variable "instance_ids" {
  type = list(string)
}