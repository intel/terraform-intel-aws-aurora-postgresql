# Example of how to pass variable for database password:
# terraform apply -var="db_password=..."
# Environment variables can also be used https://www.terraform.io/language/values/variables#environment-variables



# Provision Intel Optimized AWS MySQL server
module "optimized-aurora-server" {
  #source         = "intel/aws-aurora-postgresql/intel"
  source         = "../../"
  db_password    = var.db_password
  
  #subnet_id   = "<ENTER YOUR SUBNET ID>"
  subnet_id   = "subnet-037a019f5b6a8acca"
  # To find out what the allowed values are refer to the aws console parameter group
  # Update the vpc_id below for the VPC that this module will use. Find the vpc-id in your AWS account
  # from the AWS console or using CLI commands. In your AWS account, the vpc-id is represented as "vpc-",
  # followed by a set of alphanumeric characters. One sample representation of a vpc-id is vpc-0a6734z932p20c2m4
  #vpc_id = "<YOUR-VPC-ID-HERE>"
  vpc_id = "vpc-05f092630a4878280"
}