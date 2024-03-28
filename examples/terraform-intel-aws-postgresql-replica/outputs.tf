output "name" {
  description = "The name of the DB cluster parameter group."
  value       = module.optimized-postgres-server-read-replica.name
}

output "family" {
  description = "The family of the DB cluster parameter group."
  value       = module.optimized-postgres-server-read-replica.family
}

output "count" {
  description = "To make multiple instances and join them all to the same RDS Cluster."
  value       = module.optimized-postgres-server-read-replica.count
}

output "identifier" {
  description = "Identifier for the RDS instance, if omitted, Terraform will assign a random, unique identifier."
  value       = module.optimized-postgres-server-read-replica.identifier
}

output "identifier1" {
  description = "Identifier for the RDS instance, if omitted, Terraform will assign a random, unique identifier."
  value       = module.optimized-postgres-server-read-replica.identifier1
}

output "cluster_identifier1" {
  description = "Identifier of the aws_rds_cluster in which to launch this instance."
  value       = module.optimized-postgres-server-read-replica.identifier1
}

output "cluster_identifier" {
  description = "Identifier of the aws_rds_cluster in which to launch this instance."
  value       = module.optimized-postgres-server-read-replica.cluster_identifier
}

output "instance_class" {
  description = "The compute and memory capacity of each DB instance in the Multi-AZ DB cluster, for example db.m6g.xlarge. Not all DB instance classes are available in all AWS Regions, or for all database engines."
  value       = module.optimized-postgres-server-read-replica.instance_class
}

output "engine" {
  description = "Database engine version for AWS database instance."
  value       = module.optimized-postgres-server-read-replica.engine
}

output "engine_version" {
  description = "Database engine version for AWS database instance."
  value       = module.optimized-postgres-server-read-replica.engine_version
}

output "cluster_identifier_default" {
  description = "If the DB instance is a member of a DB cluster, contains the name of the DB cluster that the DB instance is a member of."
  value       = module.optimized-postgres-server-read-replica.cluster_identifier
}

output "engine_default" {
  description = "Default engine to use."
  value       = module.optimized-postgres-server-read-replica.engine
}

output "engine_version_default" {
  description = "Default engine version to use."
  value       = module.optimized-postgres-server-read-replica.engine_version
}

output "availability_zones" {
  description = "Name of the Availability Zone the DB instance is located in."
  value       = module.optimized-postgres-server-read-replica.availability_zones
}

output "database_name" {
  description = "Contains the name of the initial database of this instance that was provided at create time."
  value       = module.optimized-postgres-server-read-replica.database_name
}

output "backup_retention_period" {
  description = "Specifies the number of days for which automatic DB snapshots are retained."
  value       = module.optimized-postgres-server-read-replica.backup_retention_period
}

output "preferred_backup_window" {
  description = "Specifies the daily time range during which automated backups are created."
  value       = module.optimized-postgres-server-read-replica.preferred_backup_window
}

output "skip_final_snapshot" {
  description = "Flag to indicate whether a final snapshot will be skipped upon database termination."
  value       = module.optimized-postgres-server-read-replica.skip_final_snapshot
}

output "dbi_resource_id" {
  description = "Region-unique, immutable identifier for the DB instance."
  value       = module.optimized-postgres-server-read-replica.dbi_resource_id
}

output "dbi_resource_id1" {
  description = "Region-unique, immutable identifier for the DB instance."
  value       = module.optimized-postgres-server-read-replica.dbi_resource_id1
}

output "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
  value       = module.optimized-postgres-server-read-replica.kms_key_id
}
