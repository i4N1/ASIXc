if ( $args.Length -ne 1 ){
    Write-Host '1 argument necessary.'
}
else {
    if ( Test-Path $args[0] ){

        if ( Test-Path $args[0] -PathType Container ){
            Write-Host "It's a directory."
        }
        elseif ( Test-Path $args[0] -PathType Leaf ){
            Write-Host "It's a file."  
        }
        else {
            Write-Host "Could not tell."
        }
    }
    else {
        Write-Host $args[0] ' not found.'
    }
}