# 02-iam-applications

Creates Microsoft Entra ID applications and federated credentials.

## Goals

* Register platform-level applications in Microsoft Entra ID.
* Enable secure access to Azure via federated identities (OIDC), without using client secrets.
* Establish a reusable authentication mechanism for provisioning infrastructure.

## Why this module exists

We intentionally provide native, minimal logic for resources not yet supported by AVM, following their architectural intent.

## Before you dive in

To use these root modules effectively, you should understand:

- [ ] What Azure AD applications and service principals are.
- [ ] How federated identity works in Microsoft Entra ID.

## Usage

Go to [github-actions](github-actions/) and run the following:

```
tofu init
```

Then execute:

```
tofu apply
```

Do the same for the other applications.

### Adding a new IAM application

Copy [github-actions](github-actions) to a new directory under [02-iam-applications](../02-iam-applications/).

Adjust `key` in the [providers.tf](github-actions/providers.tf#L6) file.

Adjust `application_name` in the [locals.tf](github-actions/locals.tf#L2).

Adjust `federated_credentials` and `role_assignment_scope` in the [locals.tf](github-actions/locals.tf#L4-L9) file if needed.

Then execute:

```
tofu init
```

And:

```
tofu apply
```

## Cleanup

Go to [github-actions](github-actions/) and run the following:

```
tofu destroy
```

Do the same for the other applications.
