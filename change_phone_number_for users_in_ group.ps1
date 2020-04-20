#change telnumber for users
$group = get-adgroup -filter "name -like '*МИР Сотрудники'" 
get-adgroupmember -id $group -recursive | foreach {get-aduser $_ }
foreach($user in $users){
set-aduser -id $user -OfficePhone "+7 (812) 660-67-01"
}