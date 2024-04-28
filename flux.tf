resource "helm_release" "git_repo" {
  name            = "flux-home-git-repo"
  namespace       = "flux-system"
  chart           = "${path.module}/charts/home-flux-repo"
  description     = "Managed by Terraform"
  max_history     = 5
  atomic          = true
  cleanup_on_fail = true
  timeout         = 300

  depends_on = [
    kubernetes_namespace.flux-system,
    helm_release.flux
  ]
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
