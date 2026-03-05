resource "helm_release" "gateway_api_crds" {
  name            = "gateway-api-crds"
  namespace       = kubernetes_namespace.cilium.id
  chart           = "${path.module}/charts/gateway-api-crds"
  description     = "Managed by Terraform"
  max_history     = 5
  atomic          = true
  cleanup_on_fail = true
  timeout         = 300
}


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
    version     = "1.19.1"
    set {
      name = "ipam.operator.clusterPoolIPv4PodCIDRList"
      value = "192.168.0.0/16" # Must be configured differently to host network!
    }

    set {
      name = "ipam.operator.clusterPoolIPv6PodCIDRList"
      value = "2a06:61c2:27ae::2:0/112"
    }

    set {
      name = "ipv6.enabled"
      value = true
    }
    set {
      name = "frontend.server.ipv6"
      value = true
    }

    set {
      name = "ingressController.enabled"
      value = false
    }

    set {
      name = "gatewayAPI.enabled"
      value = true
    }

    set {
      name = "gatewayAPI.externalTrafficPolicy"
      value = "Cluster"
    }

    set {
      name = "kubeProxyReplacement"
      value = true
    }

    set {
      name = "k8sServiceHost"
      value = "10.0.0.20" # IPaddr of the control plane node
    }

    set {
      name = "k8sServicePort"
      value = "6443"
    }
    depends_on = [ helm_release.gateway_api_crds ]
}
# See https://docs.cilium.io/en/stable/network/servicemesh/ingress/ for ingress documentation
