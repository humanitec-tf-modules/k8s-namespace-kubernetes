# k8s-namespace-kubernetes

This is a Terraform / OpenTofu compatible module to be used to provision `k8s-namespace` resources on top of Kubernetes for the Humanitec Orchestrator.

## Requirements

1. There must be a module provider setup for `kubernetes` (`hashicorp/kubernetes`).
2. There must be a resource type setup for `k8s-namespace`, for example:

    ```shell
    hctl create resource-type k8s-namespace --set=description='Kubernetes Namespace' --set=output_schema='{"type":"object","required":["name"],"properties":{"name":{"type":"string"}}}'
    ```

## Installation

Install this with the `hctl` CLI, you should replace the `CHANGEME` in the module source with the latest release tag, replace the `CHANGEME` in the provider mapping with your real provider type and alias for Kubernetes.

```shell
hctl create module \
    --set=resource_type=k8s-namespace \
    --set=module_source=git::https://github.com/humanitec-tf-modules/k8s-namespace-kubernetes?ref=CHANGEME \
    --set=provider_mapping='{"kubernetes": "CHANGEME"}' \
    --set=module_inputs='{}'
```

The namespaces will be random with a "ns-" prefix by default. You should set the "name_prefix" module input if you wish to change this scheme (see the inputs section below).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace_v1.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_annotations"></a> [additional\_annotations](#input\_additional\_annotations) | Additional annotations to add to the namespace. | `map(string)` | `{}` | no |
| <a name="input_additional_labels"></a> [additional\_labels](#input\_additional\_labels) | Additional labels to add to the namespace. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The explicit name of the namespace to create. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | The name prefix to use for generate\_name if name is not set. | `string` | `"ns-"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_humanitec_metadata"></a> [humanitec\_metadata](#output\_humanitec\_metadata) | Metadata for Humanitec. |
| <a name="output_name"></a> [name](#output\_name) | The name of the namespace |
<!-- END_TF_DOCS -->