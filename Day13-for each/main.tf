variable "env" {
    type = list(string)
#    default = [ "dev", "test", "prod" ]
    default = [ "dev", "prod" ]
  
  
}
resource "aws_instance" "name" {
    ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"
    key_name = "keyvirginia"
    for_each = toset(var.env)
    tags = {
      Name = each.value
    }

  
}