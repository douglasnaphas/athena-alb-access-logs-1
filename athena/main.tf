resource "aws_s3_bucket" "alb_access_logs_query_results_bucket" {
  bucket = "aws-athena-query-results-douglasnaphas-alb-access-logs"
}

resource "aws_athena_workgroup" "alb_access_logs_workgroup" {
  name = "alb-access-logs-workgroup"
  description = "Workgroup for analyzing ALB access logs."
}

resource "aws_athena_database" "alb_access_logs_athena_db" {
  name   = "alb_access_logs_athena_db"
  bucket = aws_s3_bucket.alb_access_logs_query_results_bucket.bucket
}
