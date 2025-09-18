# organization-template

This repository provides a **foundation layer** for Infrastructure as Code on [Microsoft Azure](https://azure.microsoft.com/) using [OpenTofu](https://opentofu.org/) and [Azure Verified Modules (AVM)](https://azure.github.io/Azure-Verified-Modules/).

The template is designed to help you **bootstrap an Azure environment at scale** — including IAM roles and applications, resource groups, networking, Key Vaults, and DNS zones — all structured in a consistent and modular way.

## 🚫 What this is not

The `organization-template` is not CAF, Azure Landing Zones, or the Landing Zone Accelerator.  
It’s a lightweight bootstrap, not an enterprise framework.  
See [FAQ](./doc/faq.md) for details.

## Table of contents

* [Getting Started](#-getting-started)

  * [GitHub Actions (Recommended)](#-1-github-actions-recommended)
  * [Windows (PowerShell)](#️-2-windows-powershell)
  * [Linux / Mac OS (Bash)](#-3-linux--mac-os-bash)

* [Naming convention](#️-naming-convention)
* [Execution order](#-execution-order)
* [Scope](#️-scope)
* [Contributing](#-contributing)
* [License](#-license)

---

## 🚀 Getting Started

You can bootstrap this repository for your own Azure environment using one of three methods:

### GitHub Actions (Recommended)

You can trigger the workflow directly in GitHub UI:

1. Go to **Actions** tab -> **Bootstrap Azure infrastructure**
2. Click `Run workflow`
3. Fill in:

* Azure subscription ID
* Azure subscription name (used in folder names and naming conventions)
* Resource group name for state backend
* Storage account name for state backend
* Blob container name for state backend

4. The workflow will:

* Replace placeholders in Terraform files
* Rename folders to your actual subscription name
* Open a Pull Request with the changes

✅ No need to clone or install anything locally.

---

### Windows (PowerShell)

If you prefer to run it locally on Windows:

```
./scripts/bootstrap.ps1 `
  -subscription_id "00000000-0000-0000-0000-000000000000" `
  -subscription_name "subscription-name" `
  -resource_group_name "tfstate-rg" `
  -storage_account_name "tfstate001" `
  -container_name "tfstate"
```

---

### Linux / Mac OS (Bash)

```
./scripts/bootstrap.sh \
  00000000-0000-0000-0000-000000000000 \
  subscription-name \
  tfstate-rg \
  tfstate001 \
  tfstate
```

> Make sure you have bash, find, and sed available.

After bootstrapping is complete, you can start customizing your infrastructure modules.

---

## 🗂️ Naming convention

Directories in the root of the repository follow a strict naming convention:

<p align="center">
  <img src="docs/naming-convention.png" alt="Naming convention" width="400"/>
</p>

- **`${nn}`** — execution order number. Lower numbers must be applied first.  
- **`${optional-area}`** — optional domain or capability (e.g., `networking`).  
- **`${azure-service}`** — Azure resource or service type, always written in **plural** form (e.g., `vnets`, `keyvaults`, `dnszones`).

Examples:
- `02-iam-applications`  
- `03-resourcegroups`  
- `04-networking-nsgs`  

---

## ⚡ Execution order

The execution order follows the numeric prefix:

- Lower numbers are executed first.  
- Directories with the **same number** can be executed **in parallel**, as they have no dependencies on each other.  
- Root modules **inside the same directory** can also be executed independently, as long as they don’t depend on each other.

For example:
- `03-resourcegroups` must be applied before both `04-backupvaults` and `04-networking-nsgs`.  
- `04-backupvaults` and `04-networking-nsgs` can be applied in parallel.  
- Inside `03-resourcegroups/default-oczadly.io`, the root modules `rg-backupvault-eastus` and `rg-default-eastus` can be applied independently and in parallel.

---

## 🛠️ Scope

The `organization-template` covers **core infrastructure only**:

- IAM custom roles and applications,
- Resource Groups,
- Backup Vaults,
- networking (NSGs, VNets, DNS zones),
- Key Vaults.

Application-level infrastructure (VMs, Storage Accounts, AKS, etc.) is intentionally left out of this repository. Such workloads can be attached to the foundation using the same naming and modularity principles.

---

## 🤝 Contributing

Contributions are welcome! See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines.

> ⚠️ Please note that this project is developed and maintained in focused time blocks to ensure quality. Contributions and issues will be addressed on a best-effort basis, depending on ongoing priorities.

## 📄 License

MIT License – see [LICENSE](LICENSE) for details.
