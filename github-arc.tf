resource "kubernetes_secret" "github-arc-git-token" {
  metadata {
    name      = "git-token"
    namespace = kubernetes_namespace.github-arc.id
  }

  data = {
    username = "git"
    password = var.github_token
  }
}

resource "kubernetes_namespace" "github-arc" {
  metadata {
    annotations = {
      name = "github-arc"
    }
    name = "github-arc"
  }
}
