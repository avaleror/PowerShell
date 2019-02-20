## In here we declare parameter´s names
params([string]$coname = "coname")
## .\macAddress.ps1 -coname "computer name"
get-wmiobject -class "Win32_NetworkAdapterConfiguration" -computername $coname | Where {$_.IpEnabled -Match "True"} | select Description,MACAddress

get-wmiobject -class "Win32_NetworkAdapterConfiguration" -computername $coname |  select MACAddress

Get-SCVirtualMachine RHEL72_2 | Where {$_.hostname -Match "hyperv1"}


$VM_ID = Get-SCVirtualMachine RHEL72_2 | Where {$_.hostname -Match "hyperv1"} | select ID

Get-SCVirtualNetworkAdapter -Name 'RHEL72_2' -ID (Get-SCVirtualMachine -Name 'RHEL72_2' | Get-SCVirtualNetworkAdapter).id

Get-SCVirtualMachine -Name "RHEL72_2" | Where {$_.hostname -Match "hyperv2"} | Get-SCVirtualNetworkAdapter | select MACAddress

## Getting Snapshot from a VM
Get-SCVMMServer -ComputerName localhost | Get-SCVMCheckpoint | Where {$_.VM -Match "#{vm.name}" } | select Name
