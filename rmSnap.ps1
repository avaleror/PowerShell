## Get-VM gets a list of VM´s in the host, by concatening with Checkpoint-VM we get Snapshots if we pipe Remove-Snapshot command
## we remove ALL Snapshots in all VMs
#Get-VM | Checkpoint-VM | Remove-VMSnapshot

## Calling the script: .\rmSnap.ps1 VirtualMachine SnapshotName -IncludeAllChildSnapshots(if we want all child snapshots deleted)
Remove-VMSnapshot -VM $args[0] -Name $args[1] $args[2]