param ($dir)


$users = [System.Collections.ArrayList]::new()

$regexdateNameFile = '(([1][7-9][0-9][0-9])|(([2][0])(([0-1][0-9])|([2][0-2]))))\-((([0][1]|[0][3]|[0][5]|[0][7]|[0][8]|[1][0]|[1][2]))\-([0-2][0-9]|[3][0-1])|(([0-2][0-9]|[3][0])\-([0][4]|[0][6]|[0][9]|[1][1]))|(([0-2][0-9])\-([0][2])))\-production\.log'
$regexAuthUser = "Authenticated[\s]USER"
$regexMajName = "[A-Z][A-Z][A-Z][A-Z]"

$fileList = Get-ChildItem ./$dir/ | Get-Item | Where-Object {$_.Name -Match $regexdateNameFile} 

Write-Host $fileList
foreach($file in $fileList) 
{ 
 
    foreach($line in Get-Content -Path $file) 
    {
    
        if($line -cmatch $regexAuthUser)
        {

            Write-Host $line

            $user = (select-string -inputobject $line -Pattern $regexMajName -AllMatches).Matches.Value
            $users.Add($user)
            if ($user.Value -ne "INFO") {
        
                Write-Host "yes"
            }
             
        }
        
    } 
}

Write-Host "";
$users | Sort-Object | Get-Unique

