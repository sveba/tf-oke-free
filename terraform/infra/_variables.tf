variable "compartment_id" {
  type        = string
  description = "The compartment to create the resources in"
}

variable "region" {
  description = "OCI region"
  type        = string
  default     = "eu-frankfurt-1"
}

variable "ssh_public_key" {
  description = "SSH Public Key used to access all instances"
  type        = string
}

# https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengaboutk8sversions.htm
variable "kubernetes_version" {
  description = "Version of Kubernetes"
  type        = string
  default     = "v1.29.1"
}

variable "kubernetes_worker_nodes" {
  description = "Worker node count. If > 2, you will have to pay for the additional nodes"
  type        = number
  default     = 2
}


variable "oci_profile_name" {
  description = "Profile name in oci-config file (~/.oci/config)"
  type        = string
  default     = "DEFAULT"
}
