resource "helm_release" "longhorn" {
  chart      = "longhorn"
  name       = "longhorn"
  repository = "https://charts.longhorn.io"
  version    = "1.6.0"
  namespace  = "longhorn-system"

  create_namespace = true
  atomic           = true
  cleanup_on_fail  = true
  lint             = true
  timeout          = 120

  values = [<<YAML
defaultSettings:
  storageMinimalAvailablePercentage: 10
persistence:
  defaultClassReplicaCount: 2
YAML
  ]
}
