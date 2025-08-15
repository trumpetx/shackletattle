param(
    [string]$CL = ".\WoWCombatLog.txt"
)

if (Test-Path $CL) {
    # Read the file, filter lines containing the phrase, take the 3rd whitespace-delimited field
    $lastSeen = ""
    Get-Content $CL |
        Where-Object { $_ -match "Shackle Shatter hits" } |
        ForEach-Object {
            $fields = $_ -split '\s+'
            if ($fields.Count -ge 3) {
                $tok = $fields[2]
                # Remove 's suffix if present (like sed "s/'s$//" in the bash script)
                if ($tok -match "'s$") {
                    $trimmed = $tok -replace "'s$", ""
                } else {
                    $trimmed = $tok
                }

                # Output only if different from the last seen name (prevents consecutive duplicates)
                if ($trimmed -ne $lastSeen) {
                    $lastSeen = $trimmed
                    Write-Output $trimmed
                }
            }
        }
} else {
    Write-Error "$CL does not exist:"
    Write-Error ".\shackletattle.ps1 path/to/WoWCombatLog.txt"
}
