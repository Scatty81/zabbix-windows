# zabbix-windows
Windows Zabbix scripts

A collection of Zabbix scripts for Windows.
the goal is to get information out of Windows into zabbix so it can be used for monitoring.


### zbx-softwareinventory :
- collect software inventory from windows into zabbix.











Installation
1. install the [Zabbix Agent for windows](https://www.zabbix.com/documentation/2.0/manual/appendix/install/windows_agent).
2. place the zbx-softwareinventory.vbs in the Zabbix agents folder (for example "C:\zabbix\exe\zbx-softwareinventory.vbs")
3. copy the zabbix_softwareinventory.conf in the Zabbix agents folder (for example "C:\zabbix\conf\zabbix_softwareinventory.conf")
4. edit your Zabbix agent conf file and search for the Option: Include
  and add the following line
  Include=C:\zabbix\conf\zabbix_softwareinventory.conf
  
5. restart your agent
6. import the XML file into zabbix ( zbx-softwareinventory.xml )

