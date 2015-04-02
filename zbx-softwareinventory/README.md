<<<<<<< HEAD
# zabbix-Windows
=============

=======
# zbx-softwareinventory


**What does this script do?**

I made this script so I could create an Software inventory for my servers (trough [LLD](http://blog.zabbix.com/low-level-discovery-for-windows-services/1867/))
checking if software is installed on certain servers in 1 overview, get an notification when software is changed / removed etc.

the user-defined monitored parameters executs a custom script that runs WMI Query of Windows installed products.
the output of this query is placed into an SJON string, so Zabbix can work with it.

inside zabbix this WMI query is used to run another query to get the detailed information about this product giving us the result we want.

**Versions**

Version 1.0: First script on GitHub, improvement will follow ;-)



**How to install**

Simply place the files where Zabbix is located (for example C:\zabbix\)
edit the following files and place in the following commands

in your zabbix agentd file ( `zabbix_agentd.win.conf` )
search for `Option: Include`
add the following line
`Include=C:\zabbix\conf\zabbix_softwareinventory.conf`
and make sure the file is located there ;-)

in the `zabbix_softwareinventory.conf` file exit the following line:
`line 21: UserParameter=vbs.softwareinventoryList[*],cscript /nologo C:\zabbix\exe\zbx-softwareinventory.vbs`

and also here, make sure that the vbs file is located there ;-)


now import the XML file into your zabbix and enjoy the inventory.






>>>>>>> origin/master
