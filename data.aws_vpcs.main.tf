data "aws_vpcs" "main" {
  tags = {
    Name = "DEVELOPMENT"
  }
}
