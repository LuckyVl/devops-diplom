# 🔧 Terraform Bootstrap Module

Этот модуль создаёт базовые ресурсы для работы Terraform в Yandex Cloud:
- Сервисный аккаунт с правами `editor` и `k8s.clusters.agent`
- Статический ключ доступа для Object Storage
- Бакет для хранения remote state с версионированием

## 📋 Предварительные требования

- Установлен [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.6.0
- Установлен [YC CLI](https://cloud.yandex.ru/docs/cli/quickstart)
- Получен IAM-токен: `yc iam create-token`

## 🚀 Быстрый старт

### Шаг 1: Экспорт переменных окружения
```bash
# IAM-токен (действует 12 часов, потом нужно перевыпустить)
export YC_TOKEN=$(yc iam create-token)

# Или передайте токен напрямую (менее безопасно):
# export TF_VAR_iam_token="t1.9euelZ..."