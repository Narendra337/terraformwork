resource "aws_instance" "name" {
    ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"
    key_name = "keyvirginia"
  
}
resource "aws_s3_bucket" "name" {
    bucket = "sivaaaaa"
    provider = aws.provider2
  
}