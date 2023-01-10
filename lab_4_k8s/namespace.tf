provider "kubernetes" {
  config_path    = "/etc/rancher/k3s/k3s.yaml"
  config_context = "default"
}
variable "user" {
  description = "To prevent conflicts please put your student user as the default value"
  default     = "student"
}
locals {
  namespace = "${var.user}-namespace"
}
resource "kubernetes_namespace" "example" {
  metadata {
    name = local.namespace
  }
}