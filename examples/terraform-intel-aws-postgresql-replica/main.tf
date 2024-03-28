
module "optimized-postgres-server" {
  #source = "intel/aws-aurora-postgresql/intel"
  source         = "../../"
  db_password = var.db_password
  #subnet_id   = "<ENTER YOUR SUBNET ID>"
  subnet_id   = "subnet-037a019f5b6a8acca"

  # Update the vpc_id below for the VPC that this module will use. Find the default vpc-id in your AWS account
  # from the AWS console or using CLI commands. In your AWS account, the vpc-id is represented as "vpc-",
  # followed by a set of alphanumeric characters. One sample representation of a vpc-id is vpc-0a6734z932p20c2m4
  #vpc_id = "<YOUR-VPC-ID-HERE>"
  vpc_id = "vpc-05f092630a4878280"
}

module "optimized-postgres-server-read-replica" {
  #source      = "intel/aws-aurora-postgresql/intel"
  source         = "../../"
  db_password = var.db_password
  #subnet_id   = "<ENTER YOUR SUBNET ID>"
  subnet_id   = "subnet-037a019f5b6a8acca"
  cluster_identifier = "aurora-cluster-demo-replica" 
  cluster_instance_identifier = "aurora-cluster-instance-demo-replica" # can't have same cluster names in same regions

  # Update the vpc-id below. Use the same vpc-id as the one used in the prior module.
  #vpc_id = "<YOUR-VPC-ID-HERE>"
  vpc_id = "vpc-05f092630a4878280"
  db_replicate_source_db = module.optimized-postgres-server.dbi_resource_id
  kms_key_id          = module.optimized-postgres-server.kms_key_id
  skip_final_snapshot = true
  create_subnet_group = false
}