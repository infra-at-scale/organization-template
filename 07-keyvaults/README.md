# 07-keyvaults

Defines Azure Key Vaults for your environments.  

## Goals

* Provide secure storage for application secrets, keys, and certificates.  
* Support separation of concerns — application secrets stay in the same subscription and resource group where the application is deployed.  

## Before you dive in

To use these root modules effectively, you should understand:

- [ ] The difference between Key Vault access policies and RBAC-based access.  
- [ ] How to configure private endpoints for Key Vaults (to restrict public access).  
- [ ] How applications authenticate with Azure Key Vault using managed identities or service principals.  
- [ ] The implications of soft delete and purge protection, which are enabled by default.  
- [ ] How to structure secrets, keys, and certificates within a Key Vault for multi-team usage.  

## Usage

Go to [your-subscription/rg-default-eastus/kv-default-eastus](your-subscription/rg-default-eastus/kv-default-eastus) and run the following:

```
tofu init
```

Then execute:

```
tofu apply
```

Do the same for the other Azure Key Vaults.

### Adding a new Azure Key Vault

Copy [your-subscription/rg-default-eastus/kv-default-eastus](your-subscription/rg-default-eastus/kv-default-eastus) to a new directory under [your-subscription/rg-default-eastus](your-subscription/rg-default-eastus). If you want to create a new Azure Key Vault in a new resource group or in a new subscription, then create a directory with the new subscription name and the new resource group name. Finally, copy [your-subscription/rg-default-eastus/kv-default-eastus](your-subscription/rg-default-eastus/kv-default-eastus) there.

Adjust `key` in the [providers.tf](your-subscription/rg-default-eastus/kv-default-eastus/providers.tf#L6) file.

Adjust resource group which you want to pass in the [data.tf](your-subscription/rg-default-eastus/kv-default-eastus/data.tf#L4-L7) file.

Adjust `suffix` in the [main.tf](your-subscription/rg-default-eastus/kv-default-eastus/main.tf#L5) for your Azure Key Vault name.

Then execute:

```
tofu init
```

And:

```
tofu apply
```

## Cleanup

Go to [your-subscription/rg-default-eastus/kv-default-eastus](your-subscription/rg-default-eastus/kv-default-eastus) and run the following:

```
tofu destroy
```

Do the same for the other Azure Key Vaults.
