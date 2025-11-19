variable "name_prefix" {
  type        = string
  description = "The name prefix to use for generate_name if name is not set."
  default     = "ns-"
}

variable "name" {
  type        = string
  description = "The explicit name of the namespace to create."
  default     = null
}

variable "additional_annotations" {
  type        = map(string)
  description = "Additional annotations to add to the namespace."
  default     = {}
}

variable "additional_labels" {
  type        = map(string)
  description = "Additional labels to add to the namespace."
  default     = {}
}
