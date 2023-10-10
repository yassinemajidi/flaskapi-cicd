variable "tags" {
  type = map(string)
}

variable "api_staging_bucket" {
  type = string
}

variable "api_terraform_state" {
  type = string
}

variable "python_webserver_image" {
  type = string
}
