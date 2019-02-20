
## Get-VM gets a list of VM´s in the host, by concatening with Checkpoint-VM we get Snapshots
#Get-VM | Checkpoint-VM

## Checkpoints virtual machine Test, creating a checkpoint of it named Name
#Checkpoint-VM -VM VirtualMachine -SnapshotName Name

## Calling the script: .\WinSnap.ps1 VirtualMachineName SnapshotName (VM should exist)
Checkpoint-VM -VM $args[0] -SnapshotName $args[1]