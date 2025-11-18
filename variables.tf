variable "name" {
  type        = string
  description = "The name of the namespace to create. Should not be set if name_prefix is set."
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "The name prefix to use for generate_name. Cannot be set if name is set."
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
