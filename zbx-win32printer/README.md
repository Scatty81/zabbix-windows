<<<<<<< HEAD
<<<<<<< HEAD
# zabbix-Windows
=============

=======
# zbx-szbx-win32printer


**What does this script do?**

I made this script so I could create an Low Lever discovery for the printers on my servers (trough [LLD](http://blog.zabbix.com/low-level-discovery-for-windows-services/1867/))
since the agent does not support Win64 machines I created  this script. with the output i can perform some nice things in zabbix


**Versions**

Version 1.0: first version, only 1 LLD output (deviceID)



**How to install**

Simply place the files where Zabbix is located (for example C:\zabbix\)
edit the following files and place in the following commands

in your zabbix agentd file ( `zabbix_agentd.win.conf` )
search for `Option: Include`
add the following line
`Include=C:\zabbix\conf\zabbix_softwareinventory.conf`
and make sure the file is located there ;-)

in the `zabbix_softwareinventory.conf` file exit the following line:
`line 21: UserParameter=vbs.win32printer[*],cscript /nologo C:\zabbix\exe\zbx-win32printer.vbs`

and also here, make sure that the vbs file is located there ;-)

now import the XML file into your zabbix and enjoy the your printer overview.



**what will be shown**
Once the XML is imported, zabbix will collect the following information trough the Performance Counter.
-Jobs
-Out of paper Errors
-Total Pages Printed
-Total Jobs Printed
-Max Jobs Spooling



