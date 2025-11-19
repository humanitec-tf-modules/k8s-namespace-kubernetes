resource "kubernetes_namespace_v1" "namespace" {
  metadata {
    annotations   = var.additional_annotations
    labels        = var.additional_labels
    name          = var.name
    generate_name = var.name == null ? var.name_prefix : null
  }
  wait_for_default_service_account = true
}
