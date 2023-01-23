param ($dir)


$mails = [System.Collections.ArrayList]::new()

$regexBegLine = "^author:"
$regexMail = "\b[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b"

$fileList = Get-ChildItem ./$dir/ | Get-Item | Where-Object {$_.Name -Match '(\w+\-)Textbook.yml'} 


foreach($file in $fileList) 
{

    foreach($line in Get-Content -Path $file) 
    {
    
        if($line -match $regexBegLine)
        {

            $mail = (select-string -inputobject $line -Pattern $regexMail).Matches.Value
                
            $mails.Add($mail)
        }
        
    } 
}


Write-Host "";
$mails | Sort-Object | Get-Unique

