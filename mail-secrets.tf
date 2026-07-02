resource "kubernetes_namespace" "mail" {
  metadata {
    annotations = {
      name = "mail"
    }
    name = "mail"
  }
}

resource "kubectl_manifest" "relay_secret" {
    yaml_body = <<YAML
apiVersion: v1
kind: Secret
metadata:
  namespace: mail
  name: relay-sec
type: Opaque
data:
  user: ${data.sops_file.secrets.data["relay_user"]}
  password: ${data.sops_file.secrets.data["relay_sec"]}
YAML
}

resource "kubectl_manifest" "mailu_benr_password" {
    yaml_body = <<YAML
apiVersion: v1
kind: Secret
metadata:
  name: mailu-initial-account
  namespace: mail
type: Opaque
data:
  initial-account-password: ${data.sops_file.secrets.data.initial_mail_user_pass}
YAML
}
