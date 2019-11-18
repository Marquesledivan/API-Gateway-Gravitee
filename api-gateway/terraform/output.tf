output "addresses" {
  value = ["${aws_alb.gravitee.dns_name}"]
}