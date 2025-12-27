variable "rg_name" {
    type = string
}

variable "location" {
    type = string
    default = "eastus"
}

variable "tags" {
    type= map(string)
    default = {}
}

variable "container_name" {
    type = string
    default = "artifact_container"
}

variable "storage_account_name" {
    type = string
}

variable "blob_name" {
    type = string
    default = "artifact"
}