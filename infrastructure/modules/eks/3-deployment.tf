locals {
  python-webserver-name = "python-webserver"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.demo.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.demo.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.demo.token
}

resource "kubernetes_deployment" "python-webserver" {
  metadata {
    name      = local.python-webserver-name
    namespace = "flaskapi"
    labels = {
      run = local.python-webserver-name
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        run = local.python-webserver-name
      }
    }

    template {
      metadata {
        labels = {
          run = local.python-webserver-name
        }
      }

      spec {
        container {
          image = "yassinemajidi/randomimage-api:1.0.0"
          name  = local.python-webserver-name
          port {
            name           = "containerport"
            container_port = 4545
          }
          liveness_probe {
            http_get {
              path = "/api/health"
              port = 4545
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }

        }
      }
    }
  }
}
