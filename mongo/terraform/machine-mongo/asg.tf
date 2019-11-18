resource "aws_autoscaling_group" "mongo" {
    name = "asg-${var.name}"
    launch_configuration = "${aws_launch_configuration.mongo.id}"
    min_size = 1
    max_size = 2
    desired_capacity  = 0
    health_check_grace_period = 180
    vpc_zone_identifier = ["${var.subnet_priv}"]
    health_check_type = "EC2"

    tag {
        key = "Name"
        value = "ASG-${var.name}"
        propagate_at_launch = true
    }
    tag {
        key = "Application"
        value = "${var.name}"
        propagate_at_launch = true
    }
    tag {
        key = "Componente"
        value = "Autoscaling"
        propagate_at_launch = true
    }
    tag {
        key = "Ambiente"
        value = "${var.ambiente}"
        propagate_at_launch = true
    }
    tag {
        key = "Equipe"
        value = "${var.equipe}"
        propagate_at_launch = true
    }
    tag {
        key = "BU"
        value = "${var.bu}"
        propagate_at_launch = true
    }
    tag {
        key = "TTL"
        value = "${var.ttl}"
        propagate_at_launch = true
    }
    tag {
        key = "TTLAction"
        value = "${var.ttl}"
        propagate_at_launch = true
    }
}
