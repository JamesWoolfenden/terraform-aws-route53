module "route53" {
  source     = "../../"
  name       = "freebeer"
  comment    = "This is a comment"
  vpc_tag    = "TEST"
  kms_key_id = aws_kms_key.route53.arn
}
