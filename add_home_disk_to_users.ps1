#connect to user PC home direetory
$group = get-adgroup -filter "name -like '*AS*pr*'"
get-adgroupmember -id $group | foreach{ 
$user = $_.samaccountname
$path = '\\spb-fs01\' + $user
set-aduser -id $user -homedirectory $path -HomeDrive H:
}