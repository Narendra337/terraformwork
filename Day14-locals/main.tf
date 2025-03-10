locals {
  environment = "dev"
  instance_type = "t2.micro"
  key_name = "keyvirginia"
  Name = "ec2"
}
resource "aws_instance" "name" {
    ami = "ami-08b5b3a93ed654d19"
    instance_type = local.instance_type
    key_name = local.key_name
    tags = {
      Name = local.Name
      environment = local.environment
    }

  
}