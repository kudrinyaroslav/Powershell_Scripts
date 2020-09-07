# заменяем группы в группе на их пользователей
$group = get-adgroup -filter "name -like 'DL МИР пользователи Bamboo'"

$groups = get-adgroupmember -id $group
foreach($grou in $groups){get-adgroupmember -id $grou | get-aduser | foreach-object {add-adgroupmember -identity $group -members $_}}