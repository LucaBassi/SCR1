#Get-Content $line | measure -Line -Character -Word -IgnoreWhiteSpac
#$str = "PowerShell"
# Use Length property
#$str.Length   

#--------------------------------------

$file = 'alice30.txt'

$content = Get-Content -Path $file


foreach($line in $content) {

    if($line.Length -gt 70 ){    

        $nbMots = $line | Measure-Object -Character -Word |Select-Object -Property Words

        if($nbMots.Words -gt 10){

            $nbMots = $line | Measure-Object -Character -Word | Select-Object -Property Words
            write-host "["$nbMots.Words"]" $line

        }
    }
}

echo $wesh