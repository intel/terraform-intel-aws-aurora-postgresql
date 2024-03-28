output "name" {
  description = "The name of the DB cluster parameter group."
  value       = aws_rds_cluster_parameter_group.rds.name 
}

output "family" {
  description = "The family of the DB cluster parameter group."
  value       = aws_rds_cluster_parameter_group.rds.family
}

output "count" {
  description = "To make multiple instances and join them all to the same RDS Cluster."
  value       = length(aws_rds_cluster_instance.cluster_instances)
}

output "identifier" {
  description = "Identifier for the RDS instance, if omitted, Terraform will assign a random, unique identifier."
  value       = aws_rds_cluster_instance.cluster_instances[0].identifier
}

output "identifier1" {
  description = "Identifier for the RDS instance, if omitted, Terraform will assign a random, unique identifier."
  value       = aws_rds_cluster_instance.cluster_instances[1].identifier
}

output "cluster_identifier" {
  description = "Identifier of the aws_rds_cluster in which to launch this instance."
  value       = aws_rds_cluster_instance.cluster_instances[0].cluster_identifier
}

output "cluster_identifier1" {
  description = "Identifier of the aws_rds_cluster in which to launch this instance."
  value       = aws_rds_cluster_instance.cluster_instances[1].cluster_identifier
}

output "instance_class" {
  description = "The compute and memory capacity of each DB instance in the Multi-AZ DB cluster, for example db.m6g.xlarge. Not all DB instance classes are available in all AWS Regions, or for all database engines."
  value       = aws_rds_cluster_instance.cluster_instances[0].instance_class
}

output "engine" {
  description = "Database engine version for AWS database instance."
  value       = aws_rds_cluster_instance.cluster_instances[0].engine
}

output "engine_version" {
  description = "Database engine version for AWS database instance."
  value       = aws_rds_cluster_instance.cluster_instances[0].engine_version
}

output "cluster_identifier_default" {
  description = "If the DB instance is a member of a DB cluster, contains the name of the DB cluster that the DB instance is a member of."
  value       = aws_rds_cluster.default.cluster_identifier 
}

output "engine_default" {
  description = "Default engine to use."
  value       = aws_rds_cluster.default.engine 
}

output "engine_version_default" {
  description = "Default engine version to use."
  value       = aws_rds_cluster.default.engine_version
}

output "availability_zones" {
  description = "Name of the Availability Zone the DB instance is located in."
  value       = aws_rds_cluster.default.availability_zones
}

output "database_name" {
  description = "Contains the name of the initial database of this instance that was provided at create time."
  value       = aws_rds_cluster.default.database_name
}

output "backup_retention_period" {
  description = "Specifies the number of days for which automatic DB snapshots are retained."
  value       = aws_rds_cluster.default.backup_retention_period 
}

output "preferred_backup_window" {
  description = "Specifies the daily time range during which automated backups are created."
  value       = aws_rds_cluster.default.preferred_backup_window
}

output "skip_final_snapshot" {
  description = "Flag to indicate whether a final snapshot will be skipped upon database termination."
  value       = aws_rds_cluster.default.skip_final_snapshot
}

output "dbi_resource_id" {
  description = "Region-unique, immutable identifier for the DB instance."
  value       = aws_rds_cluster_instance.cluster_instances[0].dbi_resource_id
}

output "dbi_resource_id1" {
  description = "Region-unique, immutable identifier for the DB instance."
  value       = aws_rds_cluster_instance.cluster_instances[1].dbi_resource_id
}

output "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
  value       = aws_rds_cluster.default.kms_key_id
}

output "db_endpoint" {
  description = "Connection endpoint for the database instance that has been created."
  value       = aws_rds_cluster.default.endpoint
}

output "db_port" {
  description = "The port on which the RDS cluster is accessible."
  value       = aws_rds_cluster.default.port
}

output "db_instance_id" {
  description = "The identifier of the RDS cluster instance."
  value       = aws_rds_cluster.default.id
}

output "db_engine" {
  description = "The database engine used by the RDS cluster."
  value       = aws_rds_cluster.default.engine
}

output "db_name" {
  description = "Name of the database that was created (if specified) during instance creation."
  value       = aws_rds_cluster.default.database_name
}

output "db_allocated_storage" {
  description = "Storage that was allocated to the instance when it configured."
  value       = aws_rds_cluster.default.allocated_storage
}

output "db_kms_key_id" {
  description = "KMS key that is configured on the database instance if storage encryption is enabled."
  value       = aws_rds_cluster.default.kms_key_id
}

output "db_arn" {
  description = "ARN of the database instance."
  value       = aws_rds_cluster.default.arn
}
