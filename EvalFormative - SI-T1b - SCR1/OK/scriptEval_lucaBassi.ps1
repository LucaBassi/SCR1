
param ($file)

$input_path = "YamlDocs/$file"
$output_file = "results.txt"
$regexBegLine = "^author:"
$regexMail = "\b[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b"


foreach($line in Get-Content -Path $input_path) 
{
    if($line -match $regexBegLine)
    {
        foreach($word in $line){
            if($word -match $regexMail){
                select-string -inputobject $word -Pattern $regexMail -AllMatches | Foreach-Object { $_.Matches } | Foreach-Object { $_.Value } > $output_file
                select-string -inputobject $word -Pattern $regexMail -AllMatches | Foreach-Object { $_.Matches } | Foreach-Object { $_.Value } | write-host
                $resVar = select-string -inputobject $word -Pattern $regexMail -AllMatches | Foreach-Object { $_.Matches } | Foreach-Object { $_.Value }
                write-host $resVar
            
            }
        }

    }
}

