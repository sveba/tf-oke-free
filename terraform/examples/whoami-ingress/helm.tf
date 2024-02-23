resource "helm_release" "whoami" {
  chart      = "app-template"
  name       = "whoami"
  repository = "https://bjw-s.github.io/helm-charts/"
  version    = "2.6.0"
  namespace  = "whoami"

  create_namespace = true
  atomic           = true
  cleanup_on_fail  = true
  lint             = true
  timeout          = 60

  values = [templatefile("${path.module}/values.yaml", {host = var.host})]
}
