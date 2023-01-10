resource "kubernetes_deployment" "k8s-demo" {
  metadata {
    name      = "terraform-k8s-demo"
    namespace = local.namespace
    labels = {
      test = "k8s-demo"
    }
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        test = "k8s-demo"
      }
    }
    template {
      metadata {
        labels = {
          test = "k8s-demo"
        }
      }
      spec {
        container {
          image = "mjbright/k8s-demo:1"
          name  = "k8s-demo"
          liveness_probe {
            http_get {
              path = "/1"
              port = 80
              http_header {
                name  = "X-Custom-Header"
                value = "Ignored"
              }
            }
            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}
