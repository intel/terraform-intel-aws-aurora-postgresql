output "postgresql_port" {
  description = "postgresql instance port"
  value       = module.optimized-aurora-server.db_port
}

output "postgresql_endpoint" {
  description = "Connection endpoint for the postgresql instance that has been created"
  value       = module.optimized-aurora-server.db_endpoint
}

output "postgresql_engine" {
  description = "Database instance engine that was configured."
  value       = module.optimized-aurora-server.db_engine
}

output "instance_class" {
  description = "Instance class in use for the database instance that was created."
  value       = module.optimized-aurora-server.instance_class
}

output "postgresql_allocated_storage" {
  description = "Storage that was allocated to the instance when it configured."
  value       = module.optimized-aurora-server.db_allocated_storage
}

output "postgresql_arn" {
  description = "ARN of the database instance."
  value       = module.optimized-aurora-server.db_arn
}

output "postgresql_kms_key_id" {
  description = "KMS key that is configured on the database instance if storage encryption is enabled."
  value       = module.optimized-aurora-server.db_kms_key_id
}

output "postgresql_db_name" {
  description = "Name of the database that was created (if specified) during instance creation."
  value       = module.optimized-aurora-server.db_name
}

output "database_name" {
  description = "Database instance name."
  value       = module.optimized-aurora-server.database_name
}


output "name" {
  description = "The name of the DB cluster parameter group."
  value       = module.optimized-aurora-server.name 
}

output "family" {
  description = "The family of the DB cluster parameter group."
  value       = module.optimized-aurora-server.family
}

output "count" {
  description = "To make multiple instances and join them all to the same RDS Cluster."
  value       = module.optimized-aurora-server.count 
}

output "identifier" {
  description = "Identifier for the RDS instance, if omitted, Terraform will assign a random, unique identifier."
  value       = module.optimized-aurora-server.identifier
}

output "cluster_identifier" {
  description = "Identifier of the aws_rds_cluster in which to launch this instance."
  value       = module.optimized-aurora-server.cluster_identifier
}

output "cluster_identifier_default" {
  description = "If the DB instance is a member of a DB cluster, contains the name of the DB cluster that the DB instance is a member of."
  value       = module.optimized-aurora-server.cluster_identifier 
}

output "engine_default" {
  description = "Default engine to use."
  value       = module.optimized-aurora-server.engine 
}


output "engine" {
  description = "Database engine version for AWS database instance."
  value       = module.optimized-aurora-server.engine 
}

output "engine_version" {
  description = "Database engine version for AWS database instance."
  value       = module.optimized-aurora-server.engine_version
}

output "engine_version_default" {
  description = "Default engine version to use."
  value       = module.optimized-aurora-server.engine_version
}

output "availability_zones" {
  description = "Name of the Availability Zone the DB instance is located in."
  value       = module.optimized-aurora-server.availability_zones
}

output "backup_retention_period" {
  description = "Specifies the number of days for which automatic DB snapshots are retained."
  value       = module.optimized-aurora-server.backup_retention_period 
}

output "preferred_backup_window" {
  description = "Specifies the daily time range during which automated backups are created."
  value       = module.optimized-aurora-server.preferred_backup_window
}

output "skip_final_snapshot" {
  description = "Flag to indicate whether a final snapshot will be skipped upon database termination."
  value       = module.optimized-aurora-server.skip_final_snapshot
}
