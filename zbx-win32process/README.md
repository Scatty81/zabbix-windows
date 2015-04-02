=======
# zbx-win32process


**What does this script do?**

I made this script so I could monitor all windows processes on the machine,
based on a LLD discovery and a vbs script it checks all processes in windows into windows.

**Versions**

Version 1.0:



**How to install**

Simply place the files where Zabbix is located (for example C:\zabbix\)
edit the following files and place in the following commands

in your zabbix agentd file ( `zabbix_agentd.win.conf` )
search for `Option: Include`
add the following line
`Include=C:\zabbix\conf\zabbix_win32process.conf`
and make sure the file is located there ;-)

in the `zabbix_win32process` file edit the following line:
`line 21: UserParameter=vbs.softwareinventoryList[*],cscript /nologo C:\scripts\zabbix\exe\zbx-win32process.vbs`
to the location of the script.

and also here, make sure that the vbs file is located there ;-)


now import the XML file into your zabbix and enjoy the monitoring ;-).

*ps: some machines can cause the agent to use 25% of the CPU, so but its good to check performance issues.




>>>>>>> origin/master
