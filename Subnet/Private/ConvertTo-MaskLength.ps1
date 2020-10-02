function ConvertTo-MaskLength {
    [CmdletBinding()]
    [OutputType([Int32])]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [Alias("Mask")]
        [IPAddress]$SubnetMask
    )
    
    $binaryOctets = $SubnetMask.GetAddressBytes() | ForEach-Object { 
        [Convert]::ToString($_, 2)
    }
    ($binaryOctets -join '').Trim('0').Length
}