## Use -WhatIf for testing purposes

# manageiq/providers/microsoft/infra_manager/provision/cloning.rb # There is a mistake in here #

New-SCVMCheckpoint -VM Computer001 -Name "My Snapshot" -VMMServer SCVMMServer001

Get-SCVirtualMachine -Name "VM01" | New-SCVMCheckpoint

# Restore a virtual machine to its most recent checkpoint
Get-SCVMCheckpoint -VM "VM01" -MostRecent | Restore-SCVMCheckpoint

# Restore a virtual machine to the specified checkpoint
$Checkpoints = Get-SCVMCheckpoint -VM "VM02"
Restore-SCVMCheckpoint -VMCheckpoint $Checkpoints[$Checkpoints.count - 2]

# Remove the most recent checkpoint for a virtual machine
$Checkpoint = Get-SCVMCheckpoint -VM "VMName" -MostRecent
Remove-SCVMCheckpoint -VMCheckpoint $Checkpoint

Get-SCVMCheckpoint -VM "RHEL72_1" -MostRecent

# Remove a specified checkpoint for a virtual machine
## We get all snapshots for VM01 and put them into an array and then we pick the older one
## which it is stored in the firt position of Checkpoints array
$Checkpoints = Get-SCVMCheckpoint -VM "VM01" 
Remove-SCVMCheckpoint -VMCheckpoint $Checkpoints[0] 

##### TESTED AND WORKING  #####

## Works fine, creates a Snapshot named "Test Snapshot" of VM RHEL72_1, supposing that only there is a VM called RHEL72_1
New-SCVMCheckpoint -VM "RHEL72_1" -Name "Test Snapshot" -VMMServer "localhost"

## Works Fine, Removes Snapshot Named "Test Snapshot" It is supposed that there is only Snapshot with this name in VM "RHEL72_1"
Remove-SCVMCheckpoint -VMCheckpoint (Get-SCVMCheckpoint -VM "RHEL72_1" | Where {$_.Name -Match "Test Snapshot"})

## Works Fine, Removes Snapshot Named "Test Snapshot" It is supposed that there is only Snapshot with this name in VM "RHEL72_1"
Restore-SCVMCheckpoint -VMCheckpoint (Get-SCVMCheckpoint -VM "RHEL72_1" | Where {$_.Name -Match "Test Snapshot"})


