resource "aws_instance" "ec2" {
    ami = "ami-053a45fff0a704a47"
    instance_type = "t2.micro"
    key_name = "keyvirginia"
    tags = {
      Name = "dev"
    }
    availability_zone = "us-east-1b"
   # lifecycle {
   #  ignore_changes = [tags,]
   # }
   # lifecycle{
   #  create_before_destroy = true
   # }
   # lifecycle {
   #  prevent_destroy = false
   # }
}
