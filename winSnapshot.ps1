## In here we declare parameter´s names
params([string]$vmn = "vmn", [string]$ssn = "ssn")
## Calling the script: .\WinSnap.ps1 -vmn "VirtualMachineName" -ssn "SnapshotName" 
Checkpoint-VM -VM $vmn -SnapshotName $ssn