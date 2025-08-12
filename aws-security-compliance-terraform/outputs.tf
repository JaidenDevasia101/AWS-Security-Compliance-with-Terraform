output "config_bucket" {
  value       = aws_s3_bucket.config.bucket
  description = "S3 bucket receiving AWS Config snapshots/delivery"
}

output "rules_deployed" {
  value = [
    aws_config_config_rule.root_mfa.name,
    aws_config_config_rule.cloudtrail_enabled.name,
    aws_config_config_rule.s3_public_read.name,
    aws_config_config_rule.encrypted_volumes.name, # <— updated
    aws_config_config_rule.no_open_ssh.name
  ]
  description = "AWS Config rules deployed"
}
