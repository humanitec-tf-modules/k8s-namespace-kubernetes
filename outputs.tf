output "humanitec_metadata" {
  description = "Metadata for Humanitec."
  value = merge(
    {
      "Kubernetes-Namespace" = kubernetes_namespace_v1.namespace.metadata[0].name
    },
  )
}

output "name" {
  description = "The name of the namespace"
  value       = var.name != null ? var.name : kubernetes_namespace_v1.namespace.metadata[0].name
}
