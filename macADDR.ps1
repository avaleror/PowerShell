
$VM = Get-SCVirtualNetworkAdapter -Name '#{vm.name}'

Get-SCVirtualNetworkAdapter -ID $VMID | select MACAddress

Get-SCVirtualNetworkAdapter -Name "RHEL72_2" -ID (Get-SCVirtualMachine -Name "RHEL72_2" | Get-SCVirtualNetworkAdapter).id
##Get-SCVirtualNetworkAdapter -All | ? MACAddress -eq '00:50:56:AF:00:6D' | Select Name,MACAddress,VirtualNetWork