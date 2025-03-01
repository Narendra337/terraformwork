module "s3" {
    source = "terraform-aws-modules/s3-bucket/aws"  # link from official terraform registry 
    bucket = "narendrabuckettt"
    acl = "private"
    versioning = {
        enabled = true
    }


}