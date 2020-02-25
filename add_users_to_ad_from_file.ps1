foreach($user in get-content c:\data\user_list.txt)
{
$su = $user.split(" ")
$gn = $split_user[0]
$sn = $split_user[1]
$sam = $gn + "." + $sn
$upn = $sam + "@aspj.ru"
new-aduser -name $user -givenname $ng -surname $sn -samaccountname $sam -userprincipalname $upn -emailaddress $upn -accountpassword(read-host -assecurestring "input password") -enable $true