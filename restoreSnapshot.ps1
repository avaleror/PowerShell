## In here we declare parameter´s names
params([string]$vmn = "vmn", [string]$ssn = "ssn")

## Calling the script: .\restoreSnapshot.ps1 -vmn "VirtualMachineName" -ssn "SnapshotName"
Restore-VMSnapshot -Name $ssn -VMName $vmn