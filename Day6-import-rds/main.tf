resource "aws_db_instance" "rds" {
    identifier = "database-1"
    engine = "mysql"
    username = "admin"
    password = "narendra1002"
    instance_class = "db.t4g.micro"
    vpc_security_group_ids = ["sg-03cdb4f4da3aab493"]
    multi_az = "false"
    publicly_accessible = "true"
    allocated_storage = 20
    engine_version = "8.0.40"
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot = "true"
    storage_encrypted = true
    copy_tags_to_snapshot = true
    apply_immediately = false
    #id = "db-3MGVLECHRN73D2EVQIXX3CKEZQ"
    max_allocated_storage = 1000

}