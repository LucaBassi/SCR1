param ($dir)

$output_file = "results.txt"

$regexBegLine = "^author:"
$regexMail = "\b[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b"

$fileList = Get-ChildItem ./$dir/ | Get-Item | where{$_.Name -Match '(\w+\-)Textbook.yml'} 

$testIfExist = 0

foreach($file in $fileList) 
{
    foreach($line in Get-Content -Path $file) 
    {
        if($line -match $regexBegLine)
        {
            foreach($word in $line){
                write-host $word
                if($word -match $regexMail){
                    
                    $resVar = select-string -inputobject $word -Pattern $regexMail -AllMatches | Foreach-Object { $_.Matches } | Foreach-Object { $_.Value }
                    write-host $resVar
                    
                    foreach($result in Get-Content -Path $output_file) {
                        if($resVar -eq $result){
                            $testIfExist = 1
                        }

                    }

                    if($testIfExist -eq 0){
                        select-string -inputobject $word -Pattern $regexMail -AllMatches | Foreach-Object { $_.Matches } | Foreach-Object { $_.Value } >> $output_file
                        write-host "if2"
                    }

                    $testIfExist = 0
                }
            }
        }
    }
}