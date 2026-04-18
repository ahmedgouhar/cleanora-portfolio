resource "aws_lb" "cleanora_lb" {
  name               = "cleanora-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups    = [var.sg_id]

  tags = {
    Name = "cleanora-alb"
  }
}
resource "aws_lb_target_group" "tg" {
  name     = "cleanora-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
  path = "/"
  interval = 30
  timeout  = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
}
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.cleanora_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
# resource "aws_lb_target_group_attachment" "attach" {
#   count = length(var.instance_ids)

#   target_group_arn = aws_lb_target_group.tg.arn
#   target_id        = var.instance_ids[count.index]
#   port             = 80
# }