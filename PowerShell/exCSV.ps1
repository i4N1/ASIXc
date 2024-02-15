if ($args.Length -ne 1){
    Write-Host '1 argument needed (csv file to read).'
    exit 1
}

$csvfile = $args[0]

if (Test-Path $csvfile){
    $csvdata = Import-Csv -Path $csvfile
    foreach ($row in $csvdata){
        Write-Host "Username : $($row.Username), Role: $($row.Role), Email: $($row.Email)"
    }
}
else {
    Write-Host "$csvfile not found"
    exit 2
}