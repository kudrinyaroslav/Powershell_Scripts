# get all users from OU before
$users = Get-ADUser -SearchBase "OU=before,DC=mir,DC=local"

# run over users in  OU before
foreach($user in $users){

# enter password for all users User1234
$password = ConvertTo-SecureString -String "User1234" -AsPlainText -Force

# set password for $user 
Set-ADAccountPassword -Identity $user -NewPassword $password

# unset need to change password for $user
Set-ADUser -Identity $user -ChangePasswordAtLogon $false
}
