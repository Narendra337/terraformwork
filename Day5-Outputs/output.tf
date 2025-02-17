output "ip" {
    value = aws_instance.dev.public_ip
  
}
output "az" {
    value = aws_instance.dev.availability_zone
  
}
output "privateIp" {
    value = aws_instance.test.private_ip
  
}