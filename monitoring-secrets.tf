resource "kubernetes_namespace" "monitoring" {
  metadata {
    annotations = {
      name = "monitoring"
    }
    name = "monitoring"
  }
}

resource "kubernetes_secret" "alertmanager_telegram_secret" {
  metadata {
    name      = "alertmanager-telegram-secret"
    namespace = kubernetes_namespace.monitoring.id
  }

  data = {
    token = data.sops_file.secrets.data.telegram_bot_token
  }
}
