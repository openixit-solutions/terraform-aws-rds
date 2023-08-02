output "db_endpoint" {
  description = "Endpoint to connect to database"
  value       = aws_db_instance.this.endpoint
}

output "db_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.this.arn
}
