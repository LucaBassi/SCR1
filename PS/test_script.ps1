Write-Host "Voici les fichiers qui contiennent une date :"
Get-ChildItem ./ | Get-Item | Where-Object{$_.Name -Match '.*((((((([0][1-3])|([1-2][0-9]))|([3][0-1]))|([1-9]))\.((([0][1]|[0][3]|[0][5]|[0][7]|[0][8])|([1]|[3]|[5]|[7]|[8]))|[1][0]|[1][2]))|((((([0][1-3])|([1-2][0-9]))|([3][0]))|([1-9]))\.((([0][4]|[0][6]|[0][9])|([4]|[6]|[9]))|[1][1]))|(((([1-2][0-9])|([0][1-9]))\.([0][2]))|((([1-2][0-9])|([1-9]))\.([2]))))\.(([1][7-9][0-9][0-9])|(([2][0])(([0-1][0-9])|([2][0-2]))))).*' }



Get-ChildItem ./ | Get-Item | Get-Date

#Write-Host "Voici les fichiers plus vieux que 6 mois :"
#Get-ChildItem ./ | Get-Item | Get-Date | Where-Object{$_.Month -eq ($_.Month -6)}

#Write-Host "Voici les fichiers plus vieux que 5 minute :"
#Get-ChildItem ./ | Get-Item | Get-Date | Where-Object{($_.Minute) -eq ($_.Minute -5)}


