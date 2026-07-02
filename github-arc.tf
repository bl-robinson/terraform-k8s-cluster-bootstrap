resource "kubernetes_secret" "github-arc-git-token" {
  metadata {
    name      = "git-token"
    namespace = kubernetes_namespace.github-arc.id
  }

  data = {
    github_token=data.sops_file.secrets.data.github_token_classic
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
