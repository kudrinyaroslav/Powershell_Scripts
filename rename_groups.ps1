$groups = get-adgroup -filter "name -like 'DL *'"
foreach($group in $groups){
	$len = $group.name.length
	$newname = $group.name.substring(3, $len-3)
	rename-adobject -id $group -newname $newname
}