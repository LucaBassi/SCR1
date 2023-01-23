$lines = Get-Content -Path "C:\Users\Miss Louc\Documents\GitHub\SCR1\EvalFormative - SI-T1b - SCR1\TRAIN\alice30.txt"

foreach ($line in $lines) {

    if ($line.Length -gt 70) {

        $count = (Measure-Object -InputObject $line -Word)

        if ($count.Words -gt 10 ) {
                Write-Host "["$count.Words "]" . $line
        }
    }
}


