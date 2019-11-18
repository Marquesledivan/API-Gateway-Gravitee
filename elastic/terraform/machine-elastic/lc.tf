resource "aws_launch_configuration" "elastic" {
  name_prefix     = "LC-${var.name}"
  image_id        = "${data.aws_ami.ec2-linux.id}"
  instance_type   = "m5.xlarge"
  key_name = "${var.key}"
  security_groups = ["${aws_security_group.sg-ec2-elastic.id}"]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install python2-pip -y
              pip install ansible
              mkdir /tmp/ansible; cd /tmp/ansible
              echo ${file("userdata")} | base64 -d | tar -xzf -
              sudo /usr/bin/ansible-playbook provision.yml --connection=local -i localhost, -e target=localhost
              EOF

  lifecycle {
    create_before_destroy = true
  }
}
