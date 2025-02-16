terraform {
  backend "s3" {
    bucket = "mahinari"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
