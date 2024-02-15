do {
    try{
        $nota = Read-Host 'Introduce la nota: '
        $nota = [int]$nota
    }
    catch [System.InvalidCastException]{
        $nota = $null
    }
    switch ($nota) {
        {$_ -ge 0 -and $_ -le 2} {
            Write-Host 'Nota: D'
        }
        {$_ -ge 3 -and $_ -le 4} {
            Write-Host 'Nota: C-'
        }
        {$_ -ge 5 -and $_ -le 6} {
            Write-Host 'Nota: C+'
        }
        {$_ -ge 7 -and $_ -le 8} {
            Write-Host 'Nota: B'
        }
        {$_ -ge 9 -and $_ -le 10} {
            Write-Host 'Nota: A'
        }
        default {
            Write-Host 'Nota fuera del rango 0-10'
        }
    }
} until ($nota -ge 0 -and $nota -le 10)