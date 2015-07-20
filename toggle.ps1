Import-Module .\lib\DeviceManagement.psd1

$driverName = "Ricoh*"
$device = Get-Device | where {$_.name -like $driverName}
$isEnabled = $device.ConfigurationFlags -eq 0

If ($isEnabled)
{
	$device | Disable-Device
}
Else 
{
	$device | Enable-Device
}