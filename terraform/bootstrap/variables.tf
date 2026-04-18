variable "cloud_id" {
  type    = string
  default = "b1goo5pkjq9ldvqkgp0l"
}

variable "folder_id" {
  type    = string
  default = "b1g7c66oo5q6sjc4bdlt"
}

variable "region" {
  type    = string
  default = "ru-central1"
}

variable "project_name" {
  type    = string
  default = "diplom"
}

variable "bucket_suffix" {
  type    = string
  default = "tf-state"
}

variable "enable_versioning" {
  type    = bool
  default = true
}

variable "iam_token" {
  description = "IAM-токен для авторизации в Yandex Cloud"
  type        = string
  default     = ""
  sensitive   = true
}