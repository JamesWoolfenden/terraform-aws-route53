resource "aws_route53_zone" "internal" {
  name = "internal.${var.name}"

  vpc {
    vpc_id = element(data.aws_vpcs.main.ids, 0)
  }

  tags = var.common_tags
}
