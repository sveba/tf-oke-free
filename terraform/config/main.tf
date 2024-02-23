module "ingress" {
  source = "./modules/nginx-ingress"
  compartment_id = var.compartment_id
}

module "certmanager" {
  source = "./modules/cert-manager"
  letsencrypt_email = var.letsencrypt_email
}

module "longhorn" {
  source = "./modules/longhorn"
}
