resource "aws_route53_zone" "internal" {
  name = "internal.${var.name}"

  vpc {
    vpc_id = element(tolist(data.aws_vpcs.main.ids), 0)
  }
}
