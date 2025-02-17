resource "aws_vpc" "prod" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "prod_vpc"
    }
  
}
resource "aws_subnet" "prod" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "pub_subnet"
    }
  
}
resource "aws_subnet" "prod1" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name="pvt_subnet"
    }
  
}
resource "aws_internet_gateway" "prod" {
    vpc_id = aws_vpc.prod.id
    tags = {
      Name = "prod_ig"
    }
  
}
resource "aws_eip" "prod" {
    tags = {
      Name = "elastic_ip"
    }
  
}
resource "aws_nat_gateway" "prod" {
    tags = {
      Name = "prod_Nat_gw"
    }
    subnet_id = aws_subnet.prod1.id
    connectivity_type = "public"
    allocation_id = aws_eip.prod.id
  
}
resource "aws_route_table" "prod1" {
    vpc_id = aws_vpc.prod.id
    tags = {
      Name = "pvt_RT"
    }
    route {
        nat_gateway_id = aws_nat_gateway.prod.id
        cidr_block = "0.0.0.0/0"
    }
  
}
resource "aws_route_table_association" "prod1" {
    route_table_id = aws_route_table.prod1.id
    subnet_id = aws_subnet.prod1.id
  
}
resource "aws_route_table" "prod" {
    vpc_id = aws_vpc.prod.id
    tags = {
      Name = "pub_RT"
    }
    route {
        gateway_id = aws_internet_gateway.prod.id
        cidr_block = "0.0.0.0/0"
    }
    
  
}
resource "aws_route_table_association" "prod" {
    route_table_id = aws_route_table.prod.id
    subnet_id = aws_subnet.prod.id
}
resource "aws_security_group" "prod" {
    name = "prod_sg"
    description = "Allow SSH"
    vpc_id = aws_vpc.prod.id
    ingress {
        description = "Allow SSH"
        from_port=22
        to_port=22
        protocol="TCP"
        cidr_blocks = [ "0.0.0.0/0" ]
         
    }
    ingress {
        description = "Allow HTTP"
        from_port=80
        to_port=80
        protocol="TCP"
        cidr_blocks = [ "0.0.0.0/0" ]
         
    }
    egress {
        description="Allow All traffic"
        from_port=0
        to_port=0
        protocol= "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
        
    }
    
  
}
resource "aws_instance" "pub_svr" {
    ami = "ami-053a45fff0a704a47"
    instance_type = "t2.micro"
    key_name = "keyvirginia"
    tags = {
      Name = "ec2"
    }
    subnet_id = aws_subnet.prod.id
    vpc_security_group_ids = [ aws_security_group.prod.id ]
}
resource "aws_instance" "pvt_svr" {
    ami = "ami-053a45fff0a704a47"
    instance_type = "t2.micro"
    key_name = "keyvirginia"
    tags = {
      Name = "pvt_ec2"
    }
    subnet_id = aws_subnet.prod1.id
    vpc_security_group_ids = [ aws_security_group.prod.id ]
}