resource "aws_launch_template" "cleanora" {
  name_prefix   = "cleanora-"
  image_id      = var.ami
  instance_type = "t3.micro"

  vpc_security_group_ids = [var.sg_id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum install -y httpd
              systemctl start httpd
              echo "Hello from ASG CLEANORA 🚀" > /var/www/html/index.html
              EOF
  )
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "cleanora-asg"
    }
  }
}
resource "aws_autoscaling_group" "cleanora" {
  desired_capacity = 1
  max_size         = 4
  min_size         = 1

  vpc_zone_identifier = var.private_subnet_ids

  launch_template {
    id      = aws_launch_template.cleanora.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "cleanora-asg"
    propagate_at_launch = true
  }
}