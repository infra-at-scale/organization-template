# 01-iam-custom-roles

Defines IAM roles that can be assigned to applications or users.

## Goals

* Apply fine-grained permissions aligned with your platform responsibilities.
* Enforce least privilege while supporting automation and GitOps workflows.
* Separate reusable role definitions from role assignments.

## Why this module exists

We intentionally provide native, minimal logic for resources not yet supported by AVM, following their architectural intent.

## Before you dive in

To use these root modules effectively, you should understand:

- [ ] How custom roles are defined using the REST API.
- [ ] The difference between `scope` (where the role is registered) and `assignable_scopes` (where it can be used).
- [ ] The difference between Azure RBAC roles used to manage infrastructure resources, and internal application roles used for delegating permissions within an application.

## Usage

Go to [your-subscription](your-subscription) and run the following:

```
tofu init
```

Then execute:

```
tofu apply
```

### Adding a new custom IAM role

Create a JSON file in [your-subscription/roles](your-subscription/roles) directory according to [Microsoft Azure documentation](https://learn.microsoft.com/en-us/azure/role-based-access-control/custom-roles#rest-api).

Then execute:

```
tofu apply
```

## Cleanup

Go to [your-subscription](your-subscription) and run the following:

```
tofu destroy
```
