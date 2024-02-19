if ($args.Length -ne 2){
    Write-Host "Needed $(2 - $($args.Length)) more arguments."
    exit 1
}
$orig = $args[0]
$dest = $args[1]
$date = Get-Date -Format "yyyyMMdd"
$dest = Join-Path -Path $dest -ChildPath "backup_$(Split-Path -Leaf $orig)_$date"
Write-Host $dest
if (Test-Path $dest -PathType Container){
    Write-Host '$dest already exists.'
    exit 2
}

if (-not (Test-Path $orig -PathType Container)){
    Write-Host '$orig not found.'
    exit 3
}
