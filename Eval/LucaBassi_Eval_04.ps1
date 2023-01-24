$file = 'alice30.txt'
$regexMaj = '^.[A-Z0-9].+$'
$content = Get-Content -Path $file

echo $content | foreach {
    if($_ -cmatch $regexMaj){
        $_
    }
}