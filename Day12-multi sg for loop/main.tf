# resource "aws_security_group" "sg1" {
#     name = "cust_sg"
#     description = "Allow inbound traffic"
#     ingress = [ 
#         for port in [22, 80, 443, 8080]:{
#             description = "Allow traffic"
#             from_port = port
#             to_port = port
#             protocol = "tcp"
#             cidr_blocks = ["0.0.0.0/0"]
#             ipv6_cidr_blocks = []
#             prefix_list_ids = []
#             security_groups = []
#             self = false
#         }
#      ]
  
# }
variable "allowedports" {
    type = map(string)
    default = {
      "22" = "0.0.0.0/0"
      "80" = "203.0.113.0/24"
      "443" = "0.0.0.0/0"
      "8080" = "10.0.0.0/16"
    }
  
}
resource "aws_security_group" "name" {
    name = "cust_sg"
    description = "Allow traffic"
    dynamic "ingress" {
        for_each = var.allowedports
        content {
          description = "Allow Traffic"
          from_port = ingress.key
          to_port = ingress.key
          protocol = "tcp"
          cidr_blocks = [ ingress.value ]
        }
      
    }
  
}
