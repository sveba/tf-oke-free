variable "host" {
  description = "Host for exposure"
  type = string
}

variable "k8s_config_path" {
  description = "OCI K8s Config Path"
  type        = string
  default     = "~/.kube/config"
}