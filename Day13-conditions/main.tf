variable "createbucket" {
    description = "set true to create bucket"
    type = bool
    default = true
  
}
resource "aws_s3_bucket" "name" {
    bucket = "sivaaaagsdanar"
    count = var.createbucket?1:0
  
}