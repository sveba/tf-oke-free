# https://cert-manager.io/docs/configuration/acme/#creating-a-basic-acme-issuer
# If you don't want to be spammed, you can use NoReply-Emailaddress generated from GitHub
# https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address
variable "letsencrypt_email" {
  description = "Email for Let's Encrypt contact"
  type = string
}

