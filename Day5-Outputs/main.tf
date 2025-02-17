resource "aws_instance" "dev" {
    ami = "ami-053a45fff0a704a47"
    instance_type = "t2.micro"
    key_name = "keyvirginia"
    tags = {
      Name = "dev"
    }
  
}
resource "aws_instance" "test" {
    ami = "ami-053a45fff0a704a47"
    instance_type = "t2.micro"
    key_name = "keyvirginia"
    tags = {
      Name = "dev"
    }
  
}