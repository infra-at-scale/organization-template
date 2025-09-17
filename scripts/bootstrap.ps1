param (
    [Parameter(Mandatory=$true)][string]$subscription_id,
    [Parameter(Mandatory=$true)][string]$subscription_name,
    [Parameter(Mandatory=$true)][string]$resource_group_name,
    [Parameter(Mandatory=$true)][string]$storage_account_name,
    [Parameter(Mandatory=$true)][string]$container_name
)

# Sanitize subscription_name (used in identifiers only)
$sanitized_subscription_name = ($subscription_name -replace '[^a-zA-Z0-9_]', '_')

# Check for folders named 'your-subscription'
$foldersToRename = Get-ChildItem -Recurse -Directory | Where-Object { $_.Name -eq "your-subscription" }

if ($foldersToRename.Count -eq 0) {
    Write-Host "Looks like the repository is already bootstrapped. No changes were made."
    exit 0
}

# Select files to edit, excluding root README.md
$rootPath = (Get-Item ".").FullName
$files = Get-ChildItem -Recurse -Include *.tf,*.tfvars,*.md,*.json -Path . | Where-Object {
    -Not $_.PSIsContainer -and
    -Not ($_.FullName -eq (Join-Path $rootPath "README.md"))
}

foreach ($file in $files) {
    $isTerraform = $file.Extension -eq ".tf"
    $lines = Get-Content $file.PSPath
    $updatedLines = foreach ($line in $lines) {
        # 1. Replace resource/data/module identifiers
        if ($isTerraform -and $line -match '^\s*(data|resource|module)\s+"[^"]+"\s+"([^"]*?)your-subscription([^"]*?)"') {
            $pattern = '(^\s*(data|resource|module)\s+"[^"]+"\s+)"([^"]*?)your-subscription([^"]*?)"'
            $line = [regex]::Replace($line, $pattern, {
                param($match)
                $prefix = $match.Groups[1].Value
                $before = $match.Groups[3].Value
                $after  = $match.Groups[4].Value
                return "$prefix`"$before$sanitized_subscription_name$after`""
            })
        }

        # 2. Replace references like custom_roles_your-subscription
        if ($isTerraform) {
            $line = [regex]::Replace($line, '([a-zA-Z0-9_\.]+)_your-subscription([a-zA-Z0-9_\.]*)', {
                param($m)
                return "$($m.Groups[1].Value)_$sanitized_subscription_name$($m.Groups[2].Value)"
            })
        }

        # 3. Replace literal placeholders
        $line = $line -replace 'your-subscription-id', $subscription_id
        $line = $line -replace 'your-subscription', $subscription_name
        $line = $line -replace 'your-resource-group-name', $resource_group_name
        $line = $line -replace 'your-storage-account-name', $storage_account_name
        $line = $line -replace 'your-container-name', $container_name

        $line
    }
    Set-Content -Path $file.PSPath -Value $updatedLines
}

# Rename folders named 'your-subscription' to the actual subscription name
foreach ($folder in $foldersToRename) {
    $newPath = Join-Path -Path $folder.Parent.FullName -ChildPath $subscription_name
    Rename-Item -Path $folder.FullName -NewName $newPath -Force
}
