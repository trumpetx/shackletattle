param(
    [string]$CL = ".\WoWCombatLog.txt"
)

if (Test-Path $CL) {
    # Read the file, filter lines containing the phrase, and group consecutive hits
    $lastName = ""
    $firstTimestamp = ""
    $count = 0
    
    Get-Content $CL |
        Where-Object { $_ -match "Shackle Shatter hits" } |
        ForEach-Object {
            $fields = $_ -split '\s+'
            if ($fields.Count -ge 3) {
                $timestamp = $fields[0] + " " + $fields[1]
                # Remove milliseconds from timestamp
                $timestamp = $timestamp -replace '\.\d{3}$', ''
                $tok = $fields[2]
                # Remove 's suffix if present
                $trimmed = $tok -replace "'s$", ""
                
                # If this is a new name, output previous group and start new one
                if ($trimmed -ne $lastName) {
                    # Output previous group if it exists
                    if ($lastName -ne "") {
                        Write-Output "$firstTimestamp $lastName ($count)"
                    }
                    
                    # Start new group
                    $lastName = $trimmed
                    $firstTimestamp = $timestamp
                    $count = 1
                } else {
                    # Same name, increment count
                    $count++
                }
            }
        }
    
    # Output the last group
    if ($lastName -ne "") {
        Write-Output "$firstTimestamp $lastName ($count)"
    }
} else {
    Write-Error "$CL does not exist:"
    Write-Error ".\shackletattle.ps1 path/to/WoWCombatLog.txt"
}
