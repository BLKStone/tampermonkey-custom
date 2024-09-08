Get-NetTCPConnection | Where-Object { $_.State -eq 'Listen' } | ForEach-Object {
    $process = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue
    [PSCustomObject]@{
        LocalAddress = $_.LocalAddress
        LocalPort = $_.LocalPort
        ProcessName = $process.Name
        PID = $_.OwningProcess
    }
} | Format-Table -AutoSize