resource "yandex_iam_service_account" "terraform" {
  folder_id = var.folder_id
  name      = "${var.project_name}-terraform-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "terraform_editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.terraform.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "terraform_storage_admin" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.terraform.id}"
}

resource "yandex_iam_service_account_static_access_key" "terraform_storage" {
  service_account_id = yandex_iam_service_account.terraform.id
  description        = "Static access key for Terraform S3 backend"
}

resource "random_string" "bucket_suffix" {
  length  = 6
  special = false
  upper   = false
  numeric = true
}

resource "yandex_storage_bucket" "terraform_state" {
  bucket     = "${var.project_name}-${var.bucket_suffix}-${random_string.bucket_suffix.result}"
  access_key = yandex_iam_service_account_static_access_key.terraform_storage.access_key
  secret_key = yandex_iam_service_account_static_access_key.terraform_storage.secret_key
  
  versioning {
    enabled = var.enable_versioning
  }
  
  anonymous_access_flags {
    read        = false
    list        = false
    config_read = false
  }
}
