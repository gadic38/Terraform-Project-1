module "eventbridge" {
  source = "terraform-aws-modules/eventbridge/aws"
  create_bus = false
  rules = {
    example = {
      description = "This rule triggers an action in response to EC2 RunInstances and stopInstances events"
      event_pattern = jsonencode({
        "source" : ["aws.ec2"],
        "detail-type": ["AWS API Call via CloudTrail"],
        "detail": {
          "eventSource": ["ec2.amazonaws.com"],
          "eventName": [
            "RunInstances",
            "stopInstances"
          ]
        }
      })
    }
  }
  targets = {
    example = {
      example_target = {
        arn           = aws_sns_topic.example.arn
        name          = "send-ec2-events-to-sns-topic"
      }
    }
  }
}
resource "aws_sns_topic" "example" {
  name = "example"
}