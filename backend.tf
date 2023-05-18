terraform {
  backend "s3" {
    bucket = "migration-lab-bucket-cloud"
    key = "talent-academy/backend/terraform.tfstates"
    region = "eu-central-1"
    dynamodb_table = "terraform-lock"
  }
}