resource "kubernetes_manifest" "git_repo" {
    manifest = {
        "apiVersion" = "source.toolkit.fluxcd.io/v1"
        "kind" = "GitRepository"
        "metadata" = {
            "name" = "home-flux"
            "namespace" = "${kubernetes_namespace.flux-system.id}"
        }
        "spec" = {
            "interval" = "5m0s"
            "ref" = {
            "branch" = "master"
            }
            "url" = "https://github.com/bl-robinson/home-flux.git"
            "secretRef" = {
                "name" = "git-token"
            }
        }
    }
    depends_on = [ helm_release.flux ]
}

resource "kubernetes_secret" "git_token" {
  metadata {
    name      = "git-token"
    namespace = kubernetes_namespace.flux-system.id
  }

  data = {
    username = "git"
    password = var.github_token
  }
  depends_on = [ helm_release.flux ]
}
