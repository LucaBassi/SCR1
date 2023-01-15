#Get-Content $line | measure -Line -Character -Word -IgnoreWhiteSpac
$str = "PowerShell"
# Use Length property
$str.Length   

#--------------------------------------

$file = 'alice30.txt'

$content = Get-Content -Path $file

$count = 0
foreach($line in $content) {
    $count++
    if($line.Length -gt 70 ){    
        write-host "["$line.Length"]" $line
        $line | Measure-Object -Character -Word
    }
}

    



