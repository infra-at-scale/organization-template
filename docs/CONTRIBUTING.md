# Contributing to organization-template

Thank you for considering contributing to **organization-template**! Your improvements and ideas are welcome.

## 🚀 Getting Started

1. **Fork this repository** and clone your fork.
2. Make sure you have [OpenTofu](https://opentofu.org/docs/intro/install/) installed.

## ✍️ Making Changes

✅ Where possible use [Azure Verified Modules](https://azure.github.io/Azure-Verified-Modules/indexes/terraform/) and [Azure Naming](https://registry.terraform.io/modules/Azure/naming/azurerm/latest) module.

✅ Ensure your change is:

* **Well-scoped** (one logical change per PR).
* Formatted and validated.
* Passes **all checks** before submitting a PR.

✅ If adding a new infrastructure area:

Add/update section in the main `README.md` to explain the purpose of the area.

## 🧪 Testing locally

You can test your changes by going to a desired directory and execute from there:

```
$ tofu init && tofu validate && tofu fmt
```

## 🚦 Submitting a Pull Request

1. Push your changes to your fork.
2. Open a Pull Request. Please use the [pull request template](../.github/pull_request_template.md) when opening a PR to ensure completeness.

## 🤝 Code of Conduct

Please be respectful and constructive in your communication. Contributions are welcome from all skill levels.

## ⚠️ Maintainer note

> This project is developed and maintained in **focused time blocks** to ensure high quality. Contributions and issues will be addressed on a **best-effort basis**, depending on ongoing priorities.

Thank you for helping make **organization-template** better! 🚀
