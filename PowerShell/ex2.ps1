if ( $args.Length -ne 3 ){
    Write-Host "3 arguments needed, " $args.Length " provided."
}
else {
    Write-Host 'Valor del primer paràmetre del script: ' $args[0]
    Write-Host 'Valor del segon paràmetre del script : ' $args[1]
    Write-Host 'Valor del tercer paràmetre del script: ' $args[2]
}