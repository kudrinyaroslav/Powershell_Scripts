# get all users from group "DL МИР пользователи confluence"
$group = get-adgroup -filter "name -like '*confluence'"

# get all users from group "DL МИР пользователи ЦО"
$CO = get-adgroup -filter "name -like '*Сотрудники ЦО'"

# get all users from group "DL МИР пользователи НО"
$NO = get-adgroup -filter "name -like 'DL МИР Сотрудники HО'"

# get all users from group "DL МИР Гости"
$Guest = get-adgroup -filter "name -like '*Гости'"



$all_users_conf = $CO + $NO + $Guest
add-adgroupmember $group -members (get-adgroupmember $all_users_conf)