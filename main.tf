locals {
  # Evaluates if a parameter wasn't supplied in the input map (someone didn't want to use it) and returns only the objects that have been configured
  db_parameters = { for parameter, value in lookup(var.db_parameters, var.engine, {}) : parameter => value if value != null /* object */ }
}

resource "random_id" "rid" {
  byte_length = 5
}

resource "aws_rds_cluster_parameter_group" "rds" {
  name   = "${var.db_parameter_group_name}-${random_id.rid.dec}"
  family = var.db_parameter_group_family

  dynamic "parameter" {
    for_each = local.db_parameters
    content {
      name         = parameter.key
      value        = parameter.value.value
      apply_method = parameter.value.apply_method
    }
  }

  lifecycle {
    create_before_destroy = true #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group#create_before_destroy-lifecycle-configuration
  }
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 2
  identifier = "${var.cluster_instance_identifier}-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version
}

resource "aws_rds_cluster" "default" {
  cluster_identifier        = var.cluster_identifier
  engine                    = var.engine
  engine_version            = var.engine_version
  availability_zones        = var.availability_zones
  database_name             = var.database_name
  master_username           = var.master_username
  master_password           = var.db_password
  backup_retention_period   = var.backup_retention_period
  preferred_backup_window   = var.preferred_backup_window
  skip_final_snapshot       = var.skip_final_snapshot
}
