resource "aws_sns_topic" "name" {
    name = "alerts"
  
}
resource "aws_sns_topic_subscription" "name" {
    topic_arn = "arn:aws:sns:us-east-1:713881824558:alerts"
    protocol = "email"
    endpoint = "aradalanarendra@gmail.com"

  
}