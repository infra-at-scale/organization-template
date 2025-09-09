# 03-resourcegroups

Defines Azure resource groups for your environments.

## Goals

* Provision resource groups in a repeatable, environment-specific way.
* Apply tagging and optional delete protection at the resource group level.

## Before you dive in

To use these root modules effectively, you should understand:

- [ ] How Azure resource groups structure resources and apply scope-based settings.
- [ ] The difference between an Azure resource group and an Azure subscription.

## Usage

Go to [your-subscription/rg-backupvault-eastus](your-subscription/rg-backupvault-eastus) and run the following:

```
tofu init
```

Then execute:

```
tofu apply
```

Do the same for the other resource groups.

### Adding a new resource group

Copy [your-subscription/rg-backupvault-eastus](your-subscription/rg-backupvault-eastus) to a new directory under [your-subscription](your-subscription/). If you want to create a new resource group in a new subscription, then create a directory with the new subscription name and copy [your-subscription/rg-backupvault-eastus](your-subscription/rg-backupvault-eastus) there.

Adjust `key` in the [providers.tf](your-subscription/rg-backupvault-eastus/providers.tf#L6) file.

Adjust `location` in the [locals.tf](your-subscription/rg-backupvault-eastus/locals.tf#L2) file if needed.

Adjust `suffix` in the [main.tf](your-subscription/rg-backupvault-eastus/main.tf#L5) for your resource group name.

Then execute:

```
tofu init
```

And:

```
tofu apply
```

## Cleanup

Go to [your-subscription/rg-backupvault-eastus](your-subscription/rg-backupvault-eastus) and run the following:

```
tofu destroy
```

Do the same for the other resource groups.
