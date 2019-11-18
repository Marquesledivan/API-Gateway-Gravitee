output "addresses" {
  value = ["${aws_elb.gravitee.dns_name}"]
}