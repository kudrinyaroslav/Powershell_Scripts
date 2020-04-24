#change telnumber for users to another pole from same user

#get group from AD
$group = get-adgroup -filter "name -like '*МИР Сотрудники'" 

#get userlist as objects from group 
$users = get-adgroupmember -id $group -recursive | foreach {get-aduser $_ -properties *}


#for each user set pole on another
foreach($user in $users){
$userphone = $user.ipphone
set-aduser -id $user -OfficePhone $userphone
}