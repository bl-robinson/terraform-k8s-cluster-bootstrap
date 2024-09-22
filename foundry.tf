resource "kubernetes_namespace" "foundry" {
  metadata {
    annotations = {
      name = "foundry"
    }
    name = "foundry"
  }
}

resource "kubectl_manifest" "foundry_secrets" {
    yaml_body = <<YAML
apiVersion: v1
kind: Secret
metadata:
  namespace: foundry
  name: foundry
type: Opaque
data:
  licenseKey: ${var.foundry_license_key}
  adminPassword: ${var.foundry_admin_password}
YAML
}
