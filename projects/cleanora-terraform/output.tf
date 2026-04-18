output "info-ec2" {
  value     = module.ec2
  sensitive = true


}
output "region" {
  value = data.aws_availability_zones.available.names
}
output "ami-id" {
  value = data.aws_ami.latest
}