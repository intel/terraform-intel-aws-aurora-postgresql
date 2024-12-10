########################
####     Intel      ####
########################

# Adjust this text to match module deployment and instance recommendations.

# See policies.md, we recommend  Intel Xeon 3rd Generation Scalable processors (code-named Ice Lake)
# Memory Optimized: db.r7i.large, db.r7i.xlarge, db.r7i.2xlarge, db.r7i.4xlarge, db.r7i.8xlarge, db.r7i.12xlarge, db.r7i.16xlarge, db.r7i.24xlarge, db.r7i.32xlarge

variable "instance_class" {
  description = "The compute and memory capacity of each DB instance in the Multi-AZ DB cluster, for example db.m6g.xlarge. Not all DB instance classes are available in all AWS Regions, or for all database engines"
  type        = string
  default     = "db.r7i.large"
}
# all parameters dynamic
########################
####     Intel      ####
########################

variable "db_parameters" {
  type = object({
    postgres = optional(object({
      temp_buffers = optional(object({
        value        = optional(string, 4096 * 1024 / 8)
        apply_method = optional(string, "immediate")
      }))
      work_mem = optional(object({
        value        = optional(string, 4096 * 1024)
        apply_method = optional(string, "immediate")
      }))
      maintenance_work_mem = optional(object({
        value        = optional(string, 512 * 1024)
        apply_method = optional(string, "immediate")
      }))
      max_stack_depth = optional(object({
        value        = optional(string, 7 * 1024)
        apply_method = optional(string, "immediate")
      }))
      effective_io_concurrency = optional(object({
        value        = optional(string, "32")
        apply_method = optional(string, "immediate")
      }))
      random_page_cost = optional(object({
        value        = optional(string, "1.1")
        apply_method = optional(string, "immediate")
      }))
      cpu_tuple_cost = optional(object({
        value        = optional(string, "0.03")
        apply_method = optional(string, "immediate")
      }))
      effective_cache_size = optional(object({
        value        = optional(string, 350 * 1024 * 1024 / 8)
        apply_method = optional(string, "immediate")
      }))
      max_connections = optional(object({
        value        = optional(string, "256")
        apply_method = optional(string, "pending-reboot")
      }))
      shared_buffers = optional(object({
        value        = optional(string, "{DBInstanceClassMemory/32768}")
        apply_method = optional(string, "pending-reboot")
      }))
      max_files_per_process = optional(object({
        value        = optional(string, "4000")
        apply_method = optional(string, "pending-reboot")
      }))
      max_worker_processes = optional(object({
        value        = optional(string, "{DBInstanceVCPU}")
        apply_method = optional(string, "pending-reboot")
      }))
      wal_buffers = optional(object({
        value        = optional(string, "-1")
        apply_method = optional(string, "pending-reboot")
      }))
      max_locks_per_transaction = optional(object({
        value        = optional(string, "64")
        apply_method = optional(string, "pending-reboot")
      }))
      max_pred_locks_per_transaction = optional(object({
        value        = optional(string, "64")
        apply_method = optional(string, "pending-reboot")
      }))
    }))
  })
  default = {
    postgres = {
      cpu_tuple_cost                 = {}
      effective_cache_size           = {}
      effective_io_concurrency       = {}
      huge_pages                     = {}
      maintenance_work_mem           = {}
      max_connections                = {}
      max_files_per_process          = {}
      max_locks_per_transaction      = {}
      max_pred_locks_per_transaction = {}
      max_stack_depth                = {}
      max_worker_processes           = {}
      random_page_cost               = {}
      shared_buffers                 = {}
      temp_buffers                   = {}
      wal_buffers                    = {}
      work_mem                       = {}
    }
  }
  description = "Intel Cloud optimizations for Xeon processors"
}


variable "tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}



########################
####    Required    ####
########################

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID within which the database resource will be created."
  type        = string
}

variable "db_password" {
  description = "Password for the master database user."
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.db_password) >= 8
    error_message = "The db_password value must be at least 8 characters in length."
  }
}

########################
####     Other      ####
########################

variable "db_subnet_group_name" {
  description = "Database subnet group name."
  type        = string
  default     = "postgresql" #null
}

variable "db_subnet_group_tag" {
  description = "Tag for the database subnet group."
  type        = map(string)
  default = {
    "Name" = "postgresql"
  }
}

variable "db_parameter_group_name" {
  description = "Name for the RDS database parameter group."
  type        = string
  default     = "aurora-postgresql"
}

variable "db_parameter_group_family" {
  description = "Family identifier for the RDS database parameter group."
  type        = string
  default     = "aurora-postgresql14"
}

variable "db_port" {
  description = "The port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "engine_version" {
  description = "Database engine version for AWS database instance."
  type        = string
  default     = "14.7" #"5.7.mysql_aurora.2.11.2" // 14.5
}

variable "engine" {
  description = "Database engine version for AWS database instance."
  type        = string
  default     = "aurora-postgresql" #'postgres'
}

variable "db_option_group" {
  type        = string
  description = "Option group name to associate with the database instance."
  default     = null
}


variable "multi_az" {
  description = "Flag that specifies if the RDS instance is multi_az."
  type        = bool
  default     = true
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of existing AWS security groups that will be attached to the RDS instance."
  default     = null
}

variable "db_ca_cert_identifier" {
  type        = string
  description = "The identifier of the CA certificate for the DB instance."
  default     = null
}

## Snapshots
variable "skip_final_snapshot" {
  description = "Flag to indicate whether a final snapshot will be skipped upon database termination."
  type        = bool
  default     = true
}

variable "final_snapshot_prefix" {
  description = "The name which is prefixed to the final snapshot on database termination."
  type        = string
  default     = "pgsql-snap-"
}

variable "db_storage_type" {
  description = "The storage type that will be set on the instance. If db_iops is set then this will be set to io1"
  type        = string
  validation {
    condition     = contains(["standard", "gp2", "io1"], var.db_storage_type)
    error_message = "The db_storage_type must be one of the following: \"standard\", \"gp2\", \"io1\"."
  }
  default = "io1"
}

variable "db_allocated_storage" {
  description = "Allocated storage for AWS database instance."
  type        = number
  default     = 200
}

variable "db_max_allocated_storage" {
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
  type        = number
  default     = 10000
}

variable "db_iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of io1."
  type        = number
  default     = 10000
}

variable "db_apply_immediately" {
  description = "Flag that specifies whether any database modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrades" {
  description = "Flag that specifies if minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  type        = bool
  default     = true
}

variable "auto_major_version_upgrades" {
  description = "Flag that specifices if major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  type        = bool
  default     = false
}

variable "db_maintenance_window" {
  type        = string
  description = "The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi"
  default     = null
}

variable "db_publicly_accessible" {
  description = "Flag to indicate whether the database will be publicly accessible."
  type        = bool
  default     = false
}

variable "kms_key_id" {
  type        = string
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
  default     = null
}

variable "db_encryption" {
  description = "Flag that specifies whether the DB instance is encrypted."
  type        = bool
  default     = true
}

# Monitoring
variable "db_monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance"
  type        = string
  validation {
    condition     = contains(["0", "1", "5", "10", "15", "30", "60"], var.db_monitoring_interval)
    error_message = "The db_monitoring_interval must be one of the following: 0, 1, 5, 10, 15, 30, 60."
  }
  default = 0
}

variable "db_monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
  type        = string
  default     = null
}

variable "db_cloudwatch_logs_export" {
  description = "Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported."
  type        = list(string)
  default     = []
}

variable "db_performance_insights" {
  description = "Flag that specifies whether Performance Insights are enabled."
  type        = bool
  default     = false
}

variable "db_performance_retention_period" {
  description = "Amount of time in days to retain Performance Insights data.Valid values are 7, 731 (2 years) or a multiple of 31."
  type        = string
  default     = null
}

variable "db_domain" {
  description = "The ID of the Directory Service Active Directory domain to create the instance in."
  type        = string
  default     = null
}

variable "db_snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console."
  type        = string
  default     = null
}

variable "db_domain_iam_role" {
  description = "(Required if db_domain is provided) The name of the IAM role to be used when making API calls to the Directory Service."
  type        = string
  default     = null
}

variable "db_custom_iam_profile" {
  description = "The instance profile associated with the underlying Amazon EC2 instance of an RDS Custom DB instance."
  type        = string
  default     = null
}

variable "db_iam_authentication" {
  description = "Flag that specifies whether mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = bool
  default     = false
}

variable "db_replicate_source_db" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate (if replicating within a single region) or ARN of the Amazon RDS Database to replicate (if replicating cross-region). Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms_key_id."
  type        = string
  default     = null
}

variable "db_timeouts" {
  type = object({
    create = optional(string, null)
    delete = optional(string, null)
    update = optional(string, null)
  })
  description = "Map of timeouts that can be adjusted when executing the module. This allows you to customize how long certain operations are allowed to take before being considered to have failed."
  default = {
    db_timeouts = {}
  }
}

variable "db_restore_time" {
  description = "The date and time to restore from. Value must be a time in Universal Coordinated Time (UTC) format and must be before the latest restorable time for the DB instance."
  type        = string
  default     = null
}

variable "db_source_dbi_resource_id" {
  description = "The resource ID of the source DB instance from which to restore. Required if source_db_instance_identifier or source_db_instance_automated_backups_arn is not specified."
  type        = string
  default     = null
}

variable "db_source_db_instance_id" {
  description = "The identifier of the source DB instance from which to restore. Must match the identifier of an existing DB instance. Required if source_db_instance_automated_backups_arn or source_dbi_resource_id is not specified."
  type        = string
  default     = null
}

variable "db_automated_backup_arn" {
  description = "The ARN of the automated backup from which to restore. Required if source_db_instance_identifier or source_dbi_resource_id is not specified."
  type        = string
  default     = null
}

variable "db_use_latest_restore_time" {
  description = "Flag that indicates whether the DB instance is restored from the latest backup time."
  type        = bool
  default     = null
}

variable "db_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: `09:46-10:16.` Must not overlap with maintenance_window."
  type        = string
  default     = null
}

variable "db_deletion_protection" {
  description = "Flag that specifies whether the DB instance is protected from deletion."
  type        = bool
  default     = false
}

variable "aws_security_group_name" {
  description = "security group name for the rds"
  type        = string
  default     = "postgresql_rds"
}

variable "ingress_from_port" {
  description = "Starting ingress port for the RDS security group."
  type        = number
  default     = 3306
}

variable "ingress_to_port" {
  description = "Ending ingress port for the RDS security group."
  type        = number
  default     = 3306
}

variable "ingress_protocol" {
  description = "Ingress protocol for the port defined in the RDS security group."
  type        = string
  default     = "tcp"
}

variable "ingress_cidr_blocks" {
  description = "Ingress CIDR block for the RDS security group."
  type        = list(string)

  # CIDR block for allowed incoming connection to the database. The default value is open to the world.
  # Change it as needed before connecting to the database
  default = ["0.0.0.0/0"]
}

variable "egress_from_port" {
  description = "Starting egress port for the RDS security group."
  type        = number
  default     = 3306
}

variable "egress_to_port" {
  description = "Ending egress port for the RDS security group."
  type        = number
  default     = 3306
}

variable "egress_protocol" {
  description = "Egress protocol for the port defined in the RDS security group."
  type        = string
  default     = "tcp"
}

variable "egress_cidr_blocks" {
  description = "Egress CIDR block for the RDS security group."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "rds_security_group_tag" {
  description = "Map of tags for the RDS security group."
  type        = map(string)
  default = {
    "Name" = "postgresql_rds"
  }
}

variable "create_security_group" {
  type        = bool
  description = "Flag that allows for the creation of a security group that allows access to the instance. Please use this for non-production use cases only."
  default     = false
}

variable "create_subnet_group" {
  type        = bool
  description = "Flag that allows for the creation of a subnet group that allows public access."
  default     = true
}

variable "cluster_identifier" {
  type        = string
  description = "If the DB instance is a member of a DB cluster, contains the name of the DB cluster that the DB instance is a member of."
  default     = "aurora-cluster-demo"
}


variable "availability_zones" {
  type        = list(string)
  description = "Name of the Availability Zone the DB instance is located in."
  default     = null
}

variable "database_name" {
  type        = string
  description = "Contains the name of the initial database of this instance that was provided at create time"
  default     = "mydb"
}

variable "master_username" {
  type        = string
  description = "Contains the master username for the DB instance."
  default     = "foo"
}

variable "backup_retention_period" {
  type        = number
  description = "Specifies the number of days for which automatic DB snapshots are retained."
  default     = 5
}

variable "preferred_backup_window" {
  type        = string
  description = "Specifies the daily time range during which automated backups are created."
  default     = "07:00-09:00"
}

variable "name" {
  type        = string
  description = "The name of the DB cluster parameter group."
  default     = "rds-cluster-pg"
}

variable "family" {
  type        = string
  description = "The family of the DB cluster parameter group."
  default     = "aurora5.6"
}

variable "cluster_instance_identifier" {
  type        = string
  description = "The identifier of the cluster instances."
  default     = "aurora-cluster-instance-demo"
}