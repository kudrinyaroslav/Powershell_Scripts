$group = get-adgroup -filter "name -like '*as*pr*'"
get-adgroupmember -id $group | foreach { 
$user = $_.samaccountname
$path = "d:\home\"+$user
new-item -path $path -itemtype Directory
$acl = get-acl -path $path
$rule=new-object system.security.accesscontrol.filesystemaccessrule $user, "modify", "containerInherit", "none", "allow"
$acl.addaccessrule($rule)
set-acl -path $path -aclobject $acl
set-acl $path $acl
$s_name = $user+'$'
new-smbShare -path $path -name $s_name -fullaccess everyone
}

