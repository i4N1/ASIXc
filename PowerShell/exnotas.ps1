do {
    try{
        $nota = Read-Host 'Introduce la nota: '
        $nota = [int]$nota
    }
    catch [System.InvalidCastException]{
        $nota = $null
    }
    if ($nota -ge 0 -and $nota -le 2){
        Write-Host 'Nota: D'
    }
    elseif ($nota -ge 3 -and $nota -le 4){
        Write-Host 'Nota: C-'
    }
    elseif ($nota -ge 5 -and $nota -le 6){
        Write-Host 'Nota: C+'
    }
    elseif ($nota -ge 7 -and $nota -le 8){
        Write-Host 'Nota: B'
    }
    elseif ($nota -ge 9 -and $nota -le 10){
        Write-Host 'Nota: A'
    }
    else {
        Write-Host 'Nota fuera del rango 0-10.'
    }
} until ($nota -ge 0 -and $nota -le 10)