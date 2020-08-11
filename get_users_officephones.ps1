# выгружаем пользователей мир с их внутренними номерами телефонов в mir.csv файл

# получаем пользователей мир из питера
$spb_users = get-aduser -searchbase "OU=MIR, OU=Users, OU=SPB, dc=astro, dc=local" -filter * -properties *

# получаем пользователей мир из новгорода
$nov_users = get-aduser -searchbase "OU=MIR, OU=Users, OU=Novgorod, dc=astro, dc=local" -filter * -properties *


$all_users = $spb_users + $nov_users
$all_users | select name, officephone | export-csv C:\scripts\mir_officephone.csv