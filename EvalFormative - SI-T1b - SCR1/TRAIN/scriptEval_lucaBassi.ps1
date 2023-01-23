
param ($file)




$testArray = [System.Collections.ArrayList]@()
$tempArray = "123", "321", "453"

foreach($item in $tempArray)
{
    $arrayID = $testArray.Add($item)
}


