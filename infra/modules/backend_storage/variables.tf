variable "rg_name" { type = string }
variable "location" { type = string }
variable "storage_account_name" { type = string }
variable "container_name" { type = string }
variable "blob_name" { type = string }

variable "tags" {
  type    = map(string)
  default = {}
}
