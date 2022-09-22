resource "aws_route53_key_signing_key" "primary" {
  hosted_zone_id             = aws_route53_zone.primary.id
  key_management_service_arn = var.kms_key_id
  name                       = "pike-primary"
}

resource "aws_route53_key_signing_key" "internal" {
  hosted_zone_id             = aws_route53_zone.internal.id
  key_management_service_arn = var.kms_key_id
  name                       = "pike-internal"
}
