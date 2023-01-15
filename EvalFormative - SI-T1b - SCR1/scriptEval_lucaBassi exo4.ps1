$file = 'petitText.txt'
$regexMaj = "^([A-Z])|^(\s+([A-Z]))"
$content = Get-Content -Path $file

foreach($line in $content) {
    if($line -match $regexMaj){
        write-host $line
    }
}