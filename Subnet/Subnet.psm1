﻿$Public = @( Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1" -Recurse )
#$Private = @( Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1" -Recurse )

@($Public) | ForEach-Object {
    Try {
        . $_.FullName
    }
    Catch {
        Write-Error -Message "Failed to import function $($_.FullName): $_"
    }
}