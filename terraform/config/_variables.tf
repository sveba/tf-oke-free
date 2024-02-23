# Can be copied from yout oci-config-file. The initial compartmendOCID == tenancyOCID 
variable "compartment_id" {
  type        = string
  description = "OCID of the compartment to create the resources in."
}

variable "k8s_config_path" {
  description = "OCI K8s Config Path"
  type        = string
  default     = "~/.kube/config"
}

variable "oci_profile_name" {
  description = "Profile name in oci-config file (~/.oci/config)"
  type        = string
  default     = "DEFAULT"
}

# https://cert-manager.io/docs/configuration/acme/#creating-a-basic-acme-issuer
# If you don't want to be spammed, you can use NoRepy-Emailaddress generated from GitHub
# https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address
variable "letsencrypt_email" {
  description = "Email for Let's Encrypt contact"
  type = string
}

