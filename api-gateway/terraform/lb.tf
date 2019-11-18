resource "aws_elb" "gravitee" {
    name = "alb-${var.name}"
    subnets = ["subnet-13a8555a","subnet-0c64d0c1c807e8d13"]
    security_groups = ["${aws_security_group.alb-sg-gravitee.id}"]
    internal           = false

  listener {
    instance_port      = 8082
    instance_protocol  = "http"
    lb_port            = 80
    lb_protocol        = "https"

  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8082/status"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 300
  connection_draining         = true
  connection_draining_timeout = 45

  tags {
    Name       = "Ledivan"
    Componente = "Ledivan"
    Ambiente   = "PRD"
    Plataforma = "Ledivan"
    Equipe     = "Ledivan"
    BU         = "CVC"
    TTL        = "NA"
    TTLAction  = "NA"
  }

  lifecycle {
    create_before_destroy = true
  }
}