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
  licenseKey: ${data.sops_file.secrets.data.foundry_license_key}
  adminPassword: ${data.sops_file.secrets.data.foundry_admin_password}
YAML
}
