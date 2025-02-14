output "aurora_cluster_id" {
  value = aws_rds_cluster.aurora.id
}

output "aurora_instance_id" {
  value = aws_rds_cluster_instance.aurora_instance[*].id
}

output "aurora_endpoint" {
  value = aws_rds_cluster.aurora.endpoint
}
