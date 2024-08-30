resource "kubernetes_namespace" "mail" {
  metadata {
    annotations = {
      name = "mail"
    }
    name = "mail"
  }
}

resource "kubectl_manifest" "sendgrid_secret" {
    yaml_body = <<YAML
apiVersion: v1
kind: Secret
metadata:
  namespace: mail
  name: sendgrid-sec
type: Opaque
data:
  user: YXBpa2V5
  password: ${var.initial_mail_user_pass}
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
  initial-account-password: ${var.initial_mail_user_pass}
YAML
}
