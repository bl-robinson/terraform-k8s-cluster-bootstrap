resource "kubernetes_namespace" "mosquitto" {
  metadata {
    annotations = {
      name = "mosquitto"
    }
    name = "mosquitto"
  }
}

resource "kubernetes_secret" "mosquitto_users" {
  metadata {
    name      = "mosquitto-users"
    namespace = kubernetes_namespace.mosquitto.id
  }

  data = {
    passwd = var.mosquitto_passwd
  }
}
