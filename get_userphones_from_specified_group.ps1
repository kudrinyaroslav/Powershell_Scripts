﻿get-adgrpumember -id DG_AS_Project_all |foreach{get_aduser $_ -properties*| select name, telephonenumber}