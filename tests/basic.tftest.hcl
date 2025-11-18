mock_provider "kubernetes" {}

run "namespace_with_name" {
  command = plan

  variables {
    additional_annotations = {
      name = "example-annotation"
    }
    additional_labels = {
      mylabel = "label-value"
    }
    name = "fizzybuzzy"
  }

  assert {
    condition     = kubernetes_namespace_v1.namespace.metadata[0].name == "fizzybuzzy"
    error_message = "name should be set"
  }
  assert {
    condition     = kubernetes_namespace_v1.namespace.metadata[0].generate_name == null
    error_message = "generate_name should not be set"
  }
  assert {
    condition = jsonencode(kubernetes_namespace_v1.namespace.metadata[0].annotations) == jsonencode({
      name = "example-annotation"
    })
    error_message = "annotations should be set"
  }
  assert {
    condition = jsonencode(kubernetes_namespace_v1.namespace.metadata[0].labels) == jsonencode({
      mylabel = "label-value"
    })
    error_message = "labels should be set"
  }
}

run "namespace_with_name_prefix" {
  command = plan

  variables {
    additional_annotations = {
      name = "example-annotation"
    }
    additional_labels = {
      mylabel = "label-value"
    }
    name_prefix = "fizzybuzzy"
  }

  assert {
    condition     = kubernetes_namespace_v1.namespace.metadata[0].generate_name == "fizzybuzzy"
    error_message = "generate_name should be set"
  }
  assert {
    condition     = kubernetes_namespace_v1.namespace.metadata[0].name != null
    error_message = "name should be set to a random value"
  }
  assert {
    condition = jsonencode(kubernetes_namespace_v1.namespace.metadata[0].annotations) == jsonencode({
      name = "example-annotation"
    })
    error_message = "annotations should be set"
  }
  assert {
    condition = jsonencode(kubernetes_namespace_v1.namespace.metadata[0].labels) == jsonencode({
      mylabel = "label-value"
    })
    error_message = "labels should be set"
  }
}
