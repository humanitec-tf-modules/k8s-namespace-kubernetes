variable "name" {
    type = string
    default = null
}

variable "name_prefix" {
    type = string
    default = null
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
