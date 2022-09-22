resource "aws_route53_query_log" "internal" {
  depends_on = [aws_cloudwatch_log_resource_policy.route53-query-logging-policy]

  cloudwatch_log_group_arn = aws_cloudwatch_log_group.route53.arn
  zone_id                  = aws_route53_zone.internal.zone_id

}
