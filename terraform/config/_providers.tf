provider "helm" {
  kubernetes {
    config_path = var.k8s_config_path
  }
}

provider "kubernetes" {
  config_path = var.k8s_config_path
}

provider "oci" {
  config_file_profile = var.oci_profile_name
}
