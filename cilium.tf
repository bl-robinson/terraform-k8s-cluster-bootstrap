

resource "kubernetes_namespace" "cilium" {
  metadata {
    annotations = {
      name = "cilium"
    }
    name = "cilium"
  }
}

resource "helm_release" "cilium" {
    name        = "cilium"
    namespace   = "cilium"
    repository  = "https://helm.cilium.io/"
    chart       = "cilium"
    set {
      name = "ipam.operator.clusterPoolIPv4PodCIDRList"
      value = "192.168.0.0/16"
    }

    set {
      name = "ipv6.enabled"
      value = false
    }
    set {
      name = "frontend.server.ipv6"
      value = false
    }

}