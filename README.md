
# zabbix-windows
Windows Zabbix scripts

A collection of Zabbix scripts for Windows.
the goal is to get information out of Windows into zabbix so it can be used for monitoring.

##### INDEX
###### zbx-softwareinventory - collect software inventory from windows into zabbix.
###### zabbix_win32printer - Collects all printers that are installed on the print server (pages printed etc.)
###### zabbix_win32process - monitor all windows processes.
###### zbx-win32filesCreated - checks if there is a file created in a folder.


##### Installation:
install the [Zabbix Agent for windows](https://www.zabbix.com/documentation/2.0/manual/appendix/install/windows_agent).

place the `zbx-softwareinventory.vbs` in the Zabbix agents folder 
(for example "C:\scripts\zabbix\exe\zbx-softwareinventory.vbs")

copy the `zabbix_softwareinventory.conf` in the Zabbix agents folder 
(for example "C:\scripts\zabbix\conf\zabbix_softwareinventory.conf")

edit your Zabbix agent conf file and search for the Option: Include
and add the following line (as example)
```
Include=C:\scripts\zabbix\conf\zabbix_softwareinventory.conf
```
restart your agent

import the XML file into zabbix ( `zbx-softwareinventory.xml` )


