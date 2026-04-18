provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.region

  # Явно передаём токен через переменную
  token = var.iam_token
}