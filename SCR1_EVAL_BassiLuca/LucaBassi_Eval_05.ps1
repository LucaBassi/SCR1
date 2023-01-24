$regex = '(.*((\.)|(-)|(_)).*)'


Get-ChildItem -File |  Where-Object {$_.Name -Match $regex} | Where-Object {$_.CreationTime -gt (Get-Date).Date}  