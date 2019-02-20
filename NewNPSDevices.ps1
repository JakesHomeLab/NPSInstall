#Change the path to the location of the csv with the list of devices to import. "DeviceName" "Address" fields are required.
$Switches = import-csv -delimiter "," -Path "C:\users\administrator\documents\NetDevices.csv"

Foreach ($Switch in $Switches)
{
    $SwitchPrefix = "Cisco"
    $SwitchPrefixEnable = $true
    if($SwitchPrefixEnable -eq $true) {$SwitchName = $SwitchPrefix + $Switch.DeviceName}
    Else{
        $SwitchName = $Switch.DeviceName
    }
    $SwitchAddress = $Switch.Address
    $SwitchSecret = "cisco"
    $SwitchVendor = "Cisco"

    New-NpsRadiusClient -Name $SwitchName -Address $SwitchAddress -SharedSecret $SwitchSecret -VendorName $SwitchVendor
}