
resource "kubernetes_service" "python_webserver_service" {
  metadata {
    name      = "python-webserver-service"
    namespace = "flaskapi"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-subnets" = "${aws_subnet.public-us-east-1.id},${aws_subnet.private-us-east-1.id}"
    }
  }
  spec {
    selector = {
      run = var.python_webserver_deployment_labels_run
    }
    port {
      port        = 80
      target_port = 4545
    }

    type = "LoadBalancer"
  }
}
