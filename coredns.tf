resource "kubectl_manifest" "core_dns_config" {
    yaml_body = <<YAML
apiVersion: v1
kind: ConfigMap
metadata:
  name: coredns
  namespace: kube-system
data:
  Corefile: |
    .:53 {
        errors
        health {
           lameduck 5s
        }
        ready
        kubernetes cluster.local in-addr.arpa ip6.arpa {
           pods insecure
           fallthrough in-addr.arpa ip6.arpa
           ttl 30
        }
        prometheus :9153
        forward . 10.0.0.103 9.9.9.9 {
           max_concurrent 1000
        }
        cache 30
        loop
        reload
        loadbalance
    }
    home.blrobinson.uk {
        forward . 10.0.0.103 9.9.9.9 {
            policy sequential
        }
    }
YAML
}