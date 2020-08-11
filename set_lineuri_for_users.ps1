# set lineuri to users
# get content of file c:\scripts\officePhone.txt
# set officephone to user
 
$lines = get-content C:\scripts\officePhones.txt
foreach($line in $lines){
    $name=$line.split(',')[0].trim('"')
    $phone=$line.split(',')[1].trim('"')
    write-host $phone
    set-csuser $name -lineuri "tel:$phone"
}