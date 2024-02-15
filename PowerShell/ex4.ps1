param(
    [Parameter(Mandatory)]
    [string]$file
)

if ( Test-Path $file ){
    if ( Test-Path $file -PathType Container ){
        Write-Host 'Contents of' $file 'are:'
        Get-ChildItem -Path $file -Force
    }
    else {
        Write-Host $file 'is not a directory.'
        exit 2
    }
}
else {
    Write-Host $file 'not found'
}