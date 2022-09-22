resource "aws_cloudwatch_log_group" "route53" {
  name              = "/route53/querylog/"
  retention_in_days = 60
  kms_key_id        = var.kms_key_id
}

data "aws_iam_policy_document" "route53-query-logging-policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:log-group:/aws/route53/*"]

    principals {
      identifiers = ["route53.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_cloudwatch_log_resource_policy" "route53-query-logging-policy" {
  provider = aws.us-east-1

  policy_document = data.aws_iam_policy_document.route53-query-logging-policy.json
  policy_name     = "route53-query-logging-policy"
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}
