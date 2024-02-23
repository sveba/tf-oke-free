terraform {
  /* Example with remote state backend in OCI-S3-Bucket
  backend "s3" {
    bucket = "terraform-states"
    key    = "config/terraform.tfstate"
    endpoints = {
      s3 = "https://${yourBucketId}.compat.objectstorage.eu-frankfurt-1.oraclecloud.com" //edit
    }
    region                      = "eu-frankfurt-1" //edit
    shared_credentials_files    = ["~/.oci/s3creds"] //edit
    profile                     = "myProfileName" //edit
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    use_path_style              = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
  */

  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}