# 05-networking-vnets

Defines virtual networks and subnets for your Azure environments.

## Goals

* Create VNETs in a modular, repeatable way across environments.
* Expose subnet outputs for downstream use (e.g. AKS, Private Endpoints, etc.).

## Before you dive in

To use these root modules effectively, you should understand:

- [ ] How Azure virtual networks and subnets are structured.
- [ ] How VNETs connect to other services (AKS, DNS, Key Vault, etc.).

## Usage

Go to [your-subscription/rg-default-eastus/vnet-default-eastus](your-subscription/rg-default-eastus/vnet-default-eastus) and run the following:

```
tofu init
```

Then execute:

```
tofu apply
```

Do the same for the other VNETs.

### Adding a new VNET

Copy [your-subscription/rg-default-eastus/vnet-default-eastus](your-subscription/rg-default-eastus/vnet-default-eastus) to a new directory under [your-subscription/rg-default-eastus](your-subscription/rg-default-eastus). If you want to create a new VNET in a new resource group or in a new subscription, then create a directory with the new subscription name and the new resource group name. Finally, copy [your-subscription/rg-default-eastus/vnet-default-eastus](your-subscription/rg-default-eastus/vnet-default-eastus) there.

Adjust `key` in the [providers.tf](your-subscription/rg-default-eastus/vnet-default-eastus/providers.tf#L6) file.

Adjust resource group which you want to pass in the [data.tf](your-subscription/rg-default-eastus/vnet-default-eastus/data.tf#L4-L7) file.

Adjust network security group which you want to pass in the [data.tf](your-subscription/rg-default-eastus/vnet-default-eastus/data.tf#L14-L17) file.

Adjust `suffix` in the [main.tf](your-subscription/rg-default-eastus/vnet-default-eastus/main.tf#L5) for your VNET name.

Then execute:

```
tofu init
```

And:

```
tofu apply
```

## Cleanup

Go to [your-subscription/rg-default-eastus/vnet-default-eastus](your-subscription/rg-default-eastus/vnet-default-eastus) and run the following:

```
tofu destroy
```

Do the same for the other VNETs.
