foreach($user in get-content C:\data\as_pr_users.txt){
set-aduser -id (get-aduser -filter "name -like '$user'") -ScriptPath netlogon.cmd
}