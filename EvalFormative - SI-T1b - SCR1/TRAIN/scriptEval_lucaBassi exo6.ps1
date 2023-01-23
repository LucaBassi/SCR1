#Get-ChildItem ./ | Get-Item | where{$_.Name -eq}
#Get-ChildItem -Path "./alice30.txt"  | Measure-Object -Property Length -Sum | Select-Object Sum, Count

#--------------------------------------
param($selSize = 1024)


$fileList = Get-ChildItem ./filesToDel/ | Get-Item
#write-host $fileList

foreach($file in $fileList){
    $size = Get-ChildItem -Path $file  | Measure-Object -Property Length -Sum | Select-Object Sum

    write-host $size
    write-host $size.Sum
    
    if ($size.Sum -lt $selSize){

        write-host "true"
        remove-item $file
        
    }
    

}

Write-Host $selSize
