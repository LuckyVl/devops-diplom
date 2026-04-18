output "service_account_id" {
  value = yandex_iam_service_account.terraform.id
}

output "bucket_name" {
  value = yandex_storage_bucket.terraform_state.bucket
}

output "storage_access_key" {
  value     = yandex_iam_service_account_static_access_key.terraform_storage.access_key
  sensitive = true
}

output "storage_secret_key" {
  value     = yandex_iam_service_account_static_access_key.terraform_storage.secret_key
  sensitive = true
}
