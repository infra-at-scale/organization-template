#!/bin/bash

set -euo pipefail

if [ "$#" -ne 5 ]; then
  echo "Usage: $0 <subscription_id> <subscription_name> <resource_group_name> <storage_account_name> <container_name>"
  exit 1
fi

subscription_id="$1"
subscription_name="$2"
resource_group_name="$3"
storage_account_name="$4"
container_name="$5"

# Sanitize subscription_name: replace anything not a-z, A-Z, 0-9, _ with _
sanitized_subscription_name=$(echo "$subscription_name" | sed 's/[^a-zA-Z0-9_]/_/g')

# Check if there are any folders named 'your-subscription'
FOLDERS=$(find . -type d -name "your-subscription")

if [ -z "$FOLDERS" ]; then
  echo "Looks like the repository is already bootstrapped. No changes were made."
  exit 0
fi

# Replace placeholders
FILES=$(find . -type f \( -name "*.tf" -o -name "*.tfvars" -o -name "*.md" -o -name "*.json" \))

for file in $FILES; do
  if [[ "$file" == *.tf ]]; then
    # First: replace identifiers like data/module/resource names
    sed -i.bak -E "s/(data|resource|module)[[:space:]]+\"([^\"]*)\"[[:space:]]+\"([^\"]*)your-subscription([^\"]*)\"/\\1 \"\\2\" \"\\3${sanitized_subscription_name}\\4\"/g" "$file"

    # Replace your-subscription in HCL identifiers (e.g. data.remote_state.custom_roles_your-subscription)
    sed -i.bak -E "s/([a-zA-Z0-9_\.]+)_your-subscription([a-zA-Z0-9_\.]*)/\1_${sanitized_subscription_name}\2/g" "$file"

    # Then: replace literal placeholders in strings and values
    sed -i.bak "s|your-subscription-id|$subscription_id|g" "$file"
    sed -i.bak "s|your-subscription|$subscription_name|g" "$file"
  else
    sed -i.bak "s|your-subscription-id|$subscription_id|g" "$file"
    sed -i.bak "s|your-subscription|$subscription_name|g" "$file"
  fi

  sed -i.bak "s|your-resource-group-name|$resource_group_name|g" "$file"
  sed -i.bak "s|your-storage-account-name|$storage_account_name|g" "$file"
  sed -i.bak "s|your-container-name|$container_name|g" "$file"
  rm "${file}.bak"
done

# Rename folders named 'your-subscription' to the actual subscription name
for folder in $FOLDERS; do
  parent=$(dirname "$folder")
  mv "$folder" "$parent/$subscription_name"
done
