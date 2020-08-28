# устанавливаем политику выполнения
Set-ExecutionPolicy RemoteSigned  

# авторизация 
$UserCredential = Get-Credential

# подключение к Exchange Online
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking

# получаем список пользователей

$spb_users = get-aduser -searchbase "OU=MIR, OU=Users, OU=SPB, dc=astro, dc=local" -filter * -properties *
$nov_users = get-aduser -searchbase "OU=MIR, OU=Users, OU=Novgorod, dc=astro, dc=local" -filter * -properties * 
$all_mir = $spb_users + $nov_users 

# на Exchange Onpremises у пользователей удалить адреса @mir.dev
????????????????????



# переносим пользователей в OU=MIR-TRANSFER,OU=Users,OU=Novgorod,DC=astro,DC=local
$TargetOU="OU=MIR-TRANSFER,OU=Users,OU=Novgorod,DC=astro,DC=local"
foreach ($user in $all_mir) {
            Move-ADObject  (get-aduser -filter "name -like '$user'")  -TargetPath $targetOU
                            }

# ожидание синхронизации между AD и Azure
Start-Sleep -s 1800


# назначить лицензии O365 пользователям в OU=Users,OU=MIR,DC=mir,DC=local
???????????????????????????


# ожидение назначения ли
цензий 5 мин
Start-Sleep -s 300

# Получить список удаленных ящиков для SourceMailbox:
$deleted_mailboxes = Get-Mailbox -SoftDeletedMailbox # | Select-Object Name, Alias, ExchangeGuid

# получить параметры ящиков пользователей в домене mir.dev для TargetMailbox
$new_mailbox = Get-Mailbox -Identity sti.mailtest3@mir.dev # | Format-List ExchangeGuid



# бежим по удаленным ящикам
foreach($deleted_mailbox in $deleted_mailboxes){
        
        # получаем guid удаленного ящика
        $deleted_guid = $deleted_mailbox.exchangeGuid

        # получаем alias удаленного ящика
        $alias = $deleted_mailbox.alias

        # формируем id для нового ящика
        $id_new_mailbox = $alias+'@mir.dev' 

        # получаем guid нового ящика
        $destin_mail_guid = (Get-Mailbox -Identity $id_new_mailbox).exchangeguid

        # восстанавливаем в новый ящик удаленный
        New-MailboxRestoreRequest -AllowLegacyDNMismatch -SourceMailbox $deleted_guid -TargetMailbox $destin_mail_guid

# создание запроса на восстановление ящиков
?????????????????????????????????????????







# пользователи с разными именами
$diff = @{
"AlexanderR"="Alexander.Ryltsov"
"ElenaS"="Elena.Grudko"
"ValentinN"="Valentin.Nikolaev"
"PavelL"="Pavel.Loktev"
"PavelB"="Pavel.Boiko"
"EkaterinaB"="Ekaterina.Bern"
"SergeyT"="Sergey.Turkin"
"DmitrySi"="Dmitry.Sivirikov"
"ElenaSp"="Elena.Spirkova"
"AlexeiS"="Alexey.Spirkov"
"OlgaSt"="Olga.Streltsova"
"MariaYa"="Maria.Yakovleva"
"VladislavSh"="Vladislav.Shaklein"
"IlyaG"="Ilya.Gozman"
}