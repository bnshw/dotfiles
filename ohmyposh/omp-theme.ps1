param (
    [string]$theme
)

if (-not $theme) {
    Write-Host "No theme link provided"
    exit 1
}

(Get-Content $PROFILE) -notmatch "oh-my-posh init pwsh --config" | Set-Content $PROFILE

$command = "oh-my-posh init pwsh --config '$theme' | Invoke-Expression"
Add-Content -Path $PROFILE -Value "$command"

(Get-Content $PROFILE) -notmatch "FALSE" | Set-Content $PROFILE

Invoke-Expression $command
