# 04-backupvaults

Defines Azure Backup Vaults for your environments.  

## Goals

* Keep vaults in dedicated resource groups (e.g. `rg-backupvault-eastus`) to separate backup management from application resources.  
* Enable consistent disaster recovery setup across all environments.

## Before you dive in

To use these root modules effectively, you should understand:

- [ ] How Azure Backup works.  
- [ ] The difference between Backup Vaults and older Recovery Services Vaults.  
- [ ] Why vaults must be deployed in the same Azure region as the resources they protect.  
- [ ] How backup policies are defined and associated with resources (VMs, databases, etc.).  

## Usage

Go to [your-subscription/rg-backupvault-eastus/bvault-eastus-default](your-subscription/rg-backupvault-eastus/bvault-eastus-default) and run the following:

```
tofu init
```

Then execute:

```
tofu apply
```

Do the same for the other Azure Backup Vaults.

### Adding a new Azure Backup Vault

Copy [your-subscription/rg-backupvault-eastus/bvault-eastus-default](your-subscription/rg-backupvault-eastus/bvault-eastus-default) to a new directory under [your-subscription/rg-backupvault-eastus](your-subscription/rg-backupvault-eastus). If you want to create a new Azure Backup Vault in a new resource group or in a new subscription, then create a directory with the new subscription name and the new resource group name. Finally, copy [your-subscription/rg-backupvault-eastus/bvault-eastus-default](your-subscription/rg-backupvault-eastus/bvault-eastus-default) there.

Adjust `key` in the [providers.tf](your-subscription/rg-backupvault-eastus/bvault-eastus-default/providers.tf#L6) file.

Adjust resource group which you want to pass in the [data.tf](your-subscription/rg-backupvault-eastus/bvault-eastus-default/data.tf#L4-L7) file.

Adjust `suffix` in the [locals.tf](your-subscription/rg-backupvault-eastus/bvault-eastus-default/locals.tf#L6) for your Azure Backup Vault name.

Then execute:

```
tofu init
```

And:

```
tofu apply
```

## Cleanup

Go to [your-subscription/rg-backupvault-eastus/bvault-eastus-default](your-subscription/rg-backupvault-eastus/bvault-eastus-default) and run the following:

```
tofu destroy
```

Do the same for the other Azure Backup Vaults.
