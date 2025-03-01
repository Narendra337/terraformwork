resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "Cloud123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.subnetgroup.id
}

resource "aws_subnet" "subnet1" {

    vpc_id = "vpc-02fe539265e429fc4"
    cidr_block = "172.31.96.0/20"
    availability_zone = "us-east-1d"

  
}
resource "aws_subnet" "name" {
    vpc_id = "vpc-02fe539265e429fc4"
    cidr_block = "172.31.112.0/20"
    availability_zone = "us-east-1c"
  
}

resource "aws_db_subnet_group" "subnetgroup" {
    subnet_ids = [ aws_subnet.subnet1.id, aws_subnet.name.id ]
    tags = {
      Name = "subnetgroup"
    }
  
}