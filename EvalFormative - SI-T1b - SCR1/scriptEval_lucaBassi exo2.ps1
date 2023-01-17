$file = 'plaques.txt'
$regexPlaque = "(^[A-Z]{2}\s[0-9]{3}\s[0-9]{1,3}$)|(^[A-Z]{2}\s[0-9]{1,5}$)"

Get-Content .\$file |ForEach-Object {
    $col1,$col2 = $_ -split '\s+\s+'

    if($col1 -match $regexPlaque){

        write-host $col1
    
    }
}
