resource "aws_instance" "name" {
    ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"
    key_name = "keyvirginia"
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("C:/Users/Gowthami/Downloads/keyvirginia.pem")
      host = self.public_ip
    }
  
}
resource "null_resource" "name" {
    depends_on = [ aws_instance.name ]
    provisioner "local-exec" {
        command = "touch file1"
      
    }
  
}
resource "null_resource" "name1" {
    depends_on = [ null_resource.name ]
    provisioner "file" {
        source = "file3"
        destination = "/home/ec2-user/file3"
    }
  
}
resource "null_resource" "name2" {
    depends_on = [ null_resource.name1 ]
    provisioner "remote-exec" {
        inline = [ 
            "touch file2",
            "echo file created in remote >> file2",
         ]
      
    }
  
}