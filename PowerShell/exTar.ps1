if ($args.Length -ne 2){
    Write-Host "Needed $(2 - $($args.Length)) more arguments."
    exit 3
}
$orig = $args[0]
$dest = $args[1]
$date = Get-Date -Format "yyyyMMdd"
$dest = Join-Path -Path $dest -ChildPath "backup_$(Split-Path -Leaf $orig)_$date.zip"

if (Test-Path $dest -PathType Leaf){
    Write-Host '$dest already exists.'
    exit 2
}

elseif (-not (Test-Path $orig -PathType Container)){
    Write-Host '$orig not found.'
    exit 1
}

else{
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::CreateFromDirectory($orig, $dest)

    Write-Host "Backup ready: $dest"
}
