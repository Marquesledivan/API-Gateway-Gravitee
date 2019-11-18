resource "aws_security_group" "alb-sg-gravitee" {
    name = "sg_alb-${var.name}"
    description = "Regras LB"
    vpc_id ="${var.vpc}"

   ingress {
       from_port = 443
       to_port = 443
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
       from_port = 80
       to_port = 80
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
   }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
        Name       = "SG-Alb-${var.name}"
        Componente = "ALB"
	Ambiente   = "${var.ambiente}"
	Plataforma = "${var.plataforma}"
	Equipe     = "${var.equipe}"
	BU         = "${var.bu}"
	TL        = "${var.ttl}"
	TLAction  = "${var.ttlaction}"
  }
}

resource "aws_security_group" "sg-ec2-gravitee" {
    name = "sg_ec2-${var.name}"
    description = "Regras LB"
    vpc_id ="${var.vpc}"

   ingress {
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_blocks = ["192.168.0.0/16"]
   }

   ingress {
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_blocks = ["10.5.26.0/23"]
   }

   ingress {
       from_port = 18082
       to_port = 18082
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
       from_port = 8082
       to_port = 8082
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
   }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }
  tags {
        Name       = "SG-EC2-${var.name}"
        Componente = "EC2"
        Ambiente   = "${var.ambiente}"
        Plataforma = "${var.plataforma}"
        Equipe     = "${var.equipe}"
        BU         = "${var.bu}"
        TL        = "${var.ttl}"
        TLAction  = "${var.ttlaction}"
  }
}
