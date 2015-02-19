' ******************************************************************************
' zbx-getInstalledSoftware
' Author:   Rutger Hermarij
' email:    rutger.hermarij@Scatty.nl
' Date:     27-01-2015
' for:      ASICS Europe B.V.
' Version:  1.0
' Script created for Zabbix monitoring,
' it is used by the agent to see what kind of software is installed on the server.
' it uses WMI to locate the software, currently it only returns the Product name and version number.
' ******************************************************************************
' example output :
 '[root@zabbix ~]# zabbix_get -s server01 -k vbs.softwareinventoryList
'{
'    "data": [
'        {
'            "{#WMIIDENTIFYINGNUMBER}": "{5FCE6D76-F5DC-37AB-B2B8-22AB8CEDB1D4}",
'            "{#WMICAPTION}": "Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161",
'            "{#WMINAME}": "Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.6161",
'            "{#WMIVERSION}": "9.0.30729.6161"
'        },
'        {
'            "{#WMIIDENTIFYINGNUMBER}": "{9BE518E6-ECC6-35A9-88E4-87755C07200F}",
'            "{#WMICAPTION}": "Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.6161",
'            "{#WMINAME}": "Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.6161",
'            "{#WMIVERSION}": "9.0.30729.6161"
'        },
'        {
'            "{#WMIIDENTIFYINGNUMBER}": "{8E34682C-8118-31F1-BC4C-98CD9675E1C2}",
'            "{#WMICAPTION}": "Microsoft .NET Framework 4 Extended",
'            "{#WMINAME}": "Microsoft .NET Framework 4 Extended",
'            "{#WMIVERSION}": "4.0.30319"
'        }
'     ]
'}
' create zabbix object:
' wmi.get["root\cimv2","SELECT Caption FROM Win32_Product WHERE IdentifyingNumber = '{#WMIIDENTIFYINGNUMBER}'"]
' wmi.get["root\cimv2","SELECT Version FROM Win32_Product WHERE IdentifyingNumber = '{#WMIIDENTIFYINGNUMBER}'"]
' etc.
' create zabbix discovery Rule:
' SoftwareID - vbs.softwareinventoryList
' zabbix agent: UserParameter=vbs.softwareinventoryList[*],cscript /nologo C:\scripts\zabbix\exe\zbx-softwareinventory.vbs


strComputer                 = "."                                               ' this computer
Set objWMIService           = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProduct		          = objWMIService.ExecQuery ("SELECT IdentifyingNumber,Caption,Name,Version from Win32_Product")

' create an array over all the WMI objects, we actially only need the IdentifyingNumber.
' since this is unique we can use this in zabbix in an object.
' wmi.get["root\cimv2","SELECT Caption FROM Win32_Product WHERE IdentifyingNumber = '{#WMIIDENTIFYINGNUMBER}'"]

For each objProduct in colProduct
  jsonValue = jsonValue & "{""{#WMIIDENTIFYINGNUMBER}"":""" & objProduct.IdentifyingNumber & ""","&_
                           """{#WMICAPTION}"":"""           & objProduct.Caption           & ""","&_
                           """{#WMINAME}"":"""              & objProduct.Name              & ""","&_
                           """{#WMIVERSION}"":"""           & objProduct.Version           & """},"
Next


JSONBegin = "{""data"":["     ' JSON begin
JSONEnd   = "]}"              ' JSON end.

' lets create the full JSON value.
createJSON = JSONBegin & jsonValue & JSONEnd
' since the array adds an "," at the end of each objProduct.Version we will remove it here.
' so the end will have an valid JSON  value.
createJSON = Replace(createJSON,",]}","]}")
JSONFinal = createJSON

' finally lets print the value.
wscript.echo JSONFinal


