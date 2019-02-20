## In here we declare parameter´s names
params([string]$vmn = "vmn", [string]$ssn = "ssn")

## Calling the script: .\rmSnapshot -vmn "VMName" -ssn "SnapshotName"
## Snapshot $ssn from VM $vmn will be deleted
Remove-VMSnapshot -VM $vmn -Name $ssn