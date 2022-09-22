resource "aws_kms_key" "route53" {
  enable_key_rotation = true
}
