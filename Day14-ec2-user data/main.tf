resource "aws_instance" "name" {
    ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"
    key_name = "keyvirginia"
    user_data = file("test.sh")
  
}