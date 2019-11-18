resource "aws_security_group" "sg-ec2-elastic" {
    name = "sg_ec2-${var.name}"
    description = "Regras LB"
    vpc_id ="${var.vpc}"

   ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
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
