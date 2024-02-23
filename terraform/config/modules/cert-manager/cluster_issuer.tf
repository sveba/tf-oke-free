resource "kubernetes_manifest" "clusterissuer_letsencrypt" {
  depends_on = [
    helm_release.cert-manager
  ]

  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind = "ClusterIssuer"
    metadata = {
      name = "letsencrypt"
    }
    spec = {
      acme = {
        email = var.letsencrypt_email
        privateKeySecretRef = {
          name = "letsencrypt"
        }
        server = "https://acme-v02.api.letsencrypt.org/directory"
        solvers = [
          {
            http01 = {
              ingress = {
                class = "nginx"
              }
            }
          }
        ]
      }
    }
  }
}