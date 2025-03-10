# resource "aws_instance" "name" {
#     ami = "ami-08b5b3a93ed654d19"
#     instance_type = "t2.micro"
#     key_name = "keyvirginia"
#     count = 2
#     # tags = {
#     #   Name = "dev"   # two instances created with same name dev
#     # }
#     # tags = {
#     #   Name = "dev-${count.index}"   # two instances created with same name dev-0 and dev-1
#     # }  
# }


variable "env" {
    type = list(string)
 #5555   default = [ "dev", "test", "prod" ]
    default = [ "dev", "prod" ]
  
}
resource "aws_instance" "name" {
        ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"
    key_name = "keyvirginia"
    count = length(var.env)
    tags = {
      Name = var.env[count.index]
    }
  
}