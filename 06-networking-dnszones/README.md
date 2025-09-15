# 06-networking-dnszones

Defines DNS Zones (both public and private) for your Azure environments.

## Goals

* Separate the definition of DNS zones from individual DNS records.
* Organize zones per subscription and resource group for granular access and management.

## Design Note

> Although the AVM module supports managing DNS records directly via inputs like `a_records`, `cname_records`, etc., we intentionally use this module only for **zone creation and optionally default/common records** (e.g. `www`, `@`, `txt` verification).

> **Records specific to applications or microservices should be defined in the application repository**, using native `azurerm_dns_*_record` resources. This allows teams to add, remove, and update records independently of the centralized zone configuration.

## Before you dive in

To use these root modules effectively, you should understand:

- [ ] The difference between public and private DNS zones in Azure.
- [ ] How zone delegation, resolution and linking works (especially for private DNS).
- [ ] How Azure DNS fits into the broader networking stack (VNet, NSG, etc).

## Usage

Go to [your-subscription/rg-default-eastus/private.your-domain](your-subscription/rg-default-eastus/private.your-domain) and run the following:

```
tofu init
```

Then execute:

```
tofu apply
```

Do the same for the other DNS zones.

### Adding a new DNS zone

Copy [your-subscription/rg-default-eastus/private.your-domain](your-subscription/rg-default-eastus/private.your-domain) to a new directory under [your-subscription/rg-default-eastus](your-subscription/rg-default-eastus). If you want to create a new DNS zone in a new resource group or in a new subscription, then create a directory with the new subscription name and the new resource group name. Finally, copy [your-subscription/rg-default-eastus/private.your-domain](your-subscription/rg-default-eastus/private.your-domain) there.

Adjust `key` in the [providers.tf](your-subscription/rg-default-eastus/private.your-domain/providers.tf#L6) file.

Adjust resource group which you want to pass in the [data.tf](your-subscription/rg-default-eastus/private.your-domain/data.tf#L4-L7) file.

Adjust virtual network which you want to pass in the [data.tf](your-subscription/rg-default-eastus/private.your-domain/data.tf#L14-L17) file.

Adjust `domain_name` in the [main.tf](your-subscription/rg-default-eastus/private.your-domain/main.tf#L5) for your domain.

Then execute:

```
tofu init
```

And:

```
tofu apply
```

## Cleanup

Go to [your-subscription/rg-default-eastus/private.your-domain](your-subscription/rg-default-eastus/private.your-domain) and run the following:

```
tofu destroy
```

Do the same for the other DNS zones.
