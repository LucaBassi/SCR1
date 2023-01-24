param ($dir)

$fileList = Get-ChildItem $dir | Get-Item | Where-Object {$_.Name -Match '((\w+).mpg)|((\w+).mp3)|((\w+).avi)|((\w+).mkv)|'} 

$selSize = 100000000

#write-host $fileList

foreach($file in $fileList){
    $size = Get-ChildItem -Path $file  | Measure-Object -Property Length -Sum | Select-Object Sum

    write-host $size
    write-host $size.Sum
    
    if ($size.Sum -gt $selSize){

        write-host "true"
        remove-item $file
        
    }
    

}

