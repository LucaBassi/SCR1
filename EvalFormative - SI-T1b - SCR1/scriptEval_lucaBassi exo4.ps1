$file = 'petitText.txt'
$regexMaj = "^(\s*([A-Z]))"
$content = Get-Content -Path $file

echo $regexMaj
echo $content | foreach {
    if($_ -match $regexMaj){
        echo "-"+$_+"-"
 #       write-host $_
    }
}