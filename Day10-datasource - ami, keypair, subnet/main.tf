# data "aws_subnet" "check" {
#     filter {
#       name = "tag:Name"
#       values = [ "subnet-0c82af9f99b4f18c4" ]
#     }
  
# }
resource "aws_instance" "name" {
    ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"
    key_name = data.aws_key_pair.key.key_name
    # subnet_id = data.aws_subnet.check.id
  
}
data "aws_key_pair" "key" {
    filter {
      name = "tag:Name"
      values = [ "keyvirginia" ]

    }
  
}
resource "aws_key_pair" "name" {
  key_name = "keyvirginia"
  public_key = file("~/.ssh/id_rsa.pub")
  
}
 
#     data "aws_ami" "amazon_linux" {
#   most_recent = true

#   owners = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Example pattern for Amazon Linux 2
#   }
# }

# resource "aws_instance" "example" {
#   ami           = data.aws_ami.amazon_linux.id
#   instance_type = "t2.micro"
#   key_name      = "keyvirginia"

#   tags = {
#     Name = "AmazonLinuxInstance"
#   }
# }

  
