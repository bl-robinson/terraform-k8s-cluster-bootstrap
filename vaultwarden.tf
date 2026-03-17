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
    admin-token = var.vaultwarden_admin_token
  }
}
