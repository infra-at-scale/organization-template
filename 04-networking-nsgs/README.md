# 04-networking-nsgs

Defines reusable network security groups (NSGs) for your environments.

## Goals

* Define NSGs in a centralized and reusable way.
* Keep NSG configuration decoupled from virtual network definitions.

## Before you dive in

To use these root modules effectively, you should understand:

- [ ] How Azure NSGs work and how they are attached to subnets or network interfaces.
- [ ] How NSGs interact with other security layers (e.g. firewalls, route tables).

## Usage

Go to [your-subscription/rg-default-eastus/nsg-default-eastus](your-subscription/rg-default-eastus/nsg-default-eastus) and run the following:

```
tofu init
```

Then execute:

```
tofu apply
```

Do the same for the other NSGs.

### Adding a new NSG

Copy [your-subscription/rg-default-eastus/nsg-default-eastus](your-subscription/rg-default-eastus/nsg-default-eastus) to a new directory under [your-subscription/rg-default-eastus](your-subscription/rg-default-eastus). If you want to create a new NSG in a new resource group or in a new subscription, then create a directory with the new subscription name and the new resource group name. Finally, copy [your-subscription/rg-default-eastus/nsg-default-eastus](your-subscription/rg-default-eastus/nsg-default-eastus) there.

Adjust `key` in the [providers.tf](your-subscription/rg-default-eastus/nsg-default-eastus/providers.tf#L6) file.

Adjust resource group which you want to pass in the [data.tf](your-subscription/rg-default-eastus/nsg-default-eastus/data.tf#L4-L7) file.

Adjust `suffix` in the [main.tf](your-subscription/rg-default-eastus/nsg-default-eastus/main.tf#L5) for your NSG name.

Then execute:

```
tofu init
```

And:

```
tofu apply
```

## Cleanup

Go to [your-subscription/rg-default-eastus/nsg-default-eastus](your-subscription/rg-default-eastus/nsg-default-eastus) and run the following:

```
tofu destroy
```

Do the same for the other NSGs.
