#fichier contenant une date dans le nom :
Get-ChildItem ./PS/ | Get-Item | where{$_.Name -Match '.*((((((([0][1-3])|([1-2][0-9]))|([3][0-1]))|([1-9]))\.((([0][1]|[0][3]|[0][5]|[0][7]|[0][8])|([1]|[3]|[5]|[7]|[8]))|[1][0]|[1][2]))|((((([0][1-3])|([1-2][0-9]))|([3][0]))|([1-9]))\.((([0][4]|[0][6]|[0][9])|([4]|[6]|[9]))|[1][1]))|(((([1-2][0-9])|([0][1-9]))\.([0][2]))|((([1-2][0-9])|([1-9]))\.([2]))))\.(([1][7-9][0-9][0-9])|(([2][0])(([0-1][0-9])|([2][0-2]))))).*' }

#Adress mail dans un fichier 
$input_path = "c:\ps\emails.txt"
$output_file = "c:\ps\extracted_addresses.txt"
$regex = "\b[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b"
select-string -Path $input_path -Pattern $regex -AllMatches | % { $_.Matches } | % { $_.Value } > $output_file

#Adress ip dans un fichier 
$input_path = "c:\ps\ip_addresses.txt"
$output_file = "c:\ps\extracted_ip_addresses.txt"
$regex = "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b"
select-string -Path $input_path -Pattern $regex -AllMatches | % { $_.Matches } | % { $_.Value } > $output_file

#URL dans un fichier 
$input_path = "c:\ps\URL_addresses.txt"
$output_file = "c:\ps\extracted_URL_addresses.txt"
$regex = "([a-zA-Z]{3,})://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)*?"
select-string -Path $input_path -Pattern $regex -AllMatches | % { $_.Matches } | % { $_.Value } > $output_file