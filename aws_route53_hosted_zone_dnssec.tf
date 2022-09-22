resource "aws_route53_hosted_zone_dnssec" "primary" {
  depends_on = [
    aws_route53_key_signing_key.primary
  ]
  hosted_zone_id = aws_route53_key_signing_key.primary.hosted_zone_id
}

resource "aws_route53_hosted_zone_dnssec" "internal" {
  depends_on = [
    aws_route53_key_signing_key.internal
  ]
  hosted_zone_id = aws_route53_key_signing_key.internal.hosted_zone_id
}
