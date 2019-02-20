## Get-VM gets a list of VM´s in the host, by concatening with Checkpoint-VM we get Snapshots
Get-VM | Checkpoint-VM

## These way we take an Snapshot from VM´s than hadn´t a Snapshot in X days
#Get-VM | Get-VMSnapshot | Where-Object {$_.CreationTime -lt (Get-Date).AddDays(-1)} | Checkpoint-VM

## Deletes ALL snapshots of virtual machine TestVM whose names starts with Experiment, of course whole snapshot name can be used intead.
Get-VM TestVM | Remove-VMSnapshot -Name Experiment*

##
Get-VM | Foreach-Object { $_ | Get-VMSnapshot | Sort-Object CreationTime | Select -Last 1 | Restore-VMSnapshot -Confirm:$false }

## listamos VMs y sus Snapshots por orden de creacion y nos quedamos por la ultima y Restauramos la Imagen
Get-VM | Get-VMSnapshot | Sort-Object CreationTime | Select -Last 1 | Restore-VMSnapshot

## Restoring a particular Snapshot to a particular VM
Restore-VMSnapshot -Name 'Whatever Name' -VMName TestVM

## In this way we take a Snapshot from VM´s than hadn´t a Snapshot in X days
Get-VM | Get-VMSnapshot | Where-Object {$_.CreationTime -lt (Get-Date).AddDays(-1)} | Checkpoint-VM

## Getting all snapshots from a VM
Get-VMSnapshot -VMName 'centos'

Get-VMSnapshot -Name 'Before applying updates' -VMName TestVM

