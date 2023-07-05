####start EC2 on 7 am

resource "aws_scheduler_schedule" "my_scheduler" {
  name       = "my-scheduler"
  group_name = "default"

  flexible_time_window {
    mode = "OFF"
  }

  # Run it each day on 7am
  schedule_expression = "cron(0 0 7 ? * * *)"

  
    # This indicates that the event should be send to EC2 API and startInstances action should be triggered
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:startInstances"
    role_arn = aws_iam_role.event_bridge_sqs_role.arn
    
    # And this block will be passed to startInstances API
    input = jsonencode({
      InstanceIds = [
        aws_instance.my_ec2.id
      ]
    })
  }


name       = "my-scheduler"
  group_name = "default"

####stop EC2 on 7 pm

  # Run it each day on 7 pm
  schedule_expression = "cron(0 0 19 ? * * *)"

    # This indicates that the event should be send to EC2 API and stopInstances action should be triggered
    arn      = "arn:aws:scheduler:::aws-sdk:ec2:stopInstances"
    role_arn = aws_iam_role.event_bridge_sqs_role.arn
    
    # And this block will be passed to stopInstances API
     input = jsonencode({
      InstanceIds = [
        aws_instance.my_ec2.id
      ]
    })
  
  