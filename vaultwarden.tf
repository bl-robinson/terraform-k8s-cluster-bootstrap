resource "kubernetes_namespace" "vaultwarden" {
  metadata {
    annotations = {
      name = "vaultwarden"
    }
    name = "vaultwarden"
  }
}

resource "kubernetes_secret" "vaultwarden_admin_token" {
  metadata {
    name      = "vaultwarden-admin-token"
    namespace = kubernetes_namespace.vaultwarden.id
  }

  data = {
    admin-token = data.sops_file.secrets.data["vaultwarden_admin_token"]
  }
}

resource "kubernetes_secret" "vaultwarden_smtp" {
  metadata {
    name      = "vaultwarden-smtp"
    namespace = kubernetes_namespace.vaultwarden.id
  }

  data = {
    username = "vaultwarden@blrobinson.uk"
    password = data.sops_file.secrets.data.vaultwarden_smtp_password
  }
}
