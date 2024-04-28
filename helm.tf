resource "kubernetes_namespace" "flux-system" {
  metadata {
    annotations = {
      name = "flux-system"
    }
    name = "flux-system"
  }
}

resource "helm_release" "flux" {
    name        = "flux"
    namespace   = "flux-system"
    repository  = "oci://ghcr.io/fluxcd-community/charts"
    chart       = "flux2"
}

resource "kubernetes_namespace" "tigera-operator" {
  metadata {
    annotations = {
      name = "tigera-operator"
    }
    name = "tigera-operator"
  }
}

resource "helm_release" "calico" {
    name        = "tigera-operator"
    namespace   = "tigera-operator"
    repository  = "https://docs.tigera.io/calico/charts"
    chart       = "tigera-operator"
}
