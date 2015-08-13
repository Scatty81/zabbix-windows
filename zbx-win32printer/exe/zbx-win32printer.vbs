' ******************************************************************************
' zbx-win32printer.vbs
' Author:   Rutger Hermarij
' email:    rutger.hermarij@Scatty.nl
' Date:     05-08-2015
' for:      ASICS Europe B.V.
' Version:  1.0
' Script created for Zabbix monitoring,

strComputer                 = "."                                               ' this computer
Set objWMIService           = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcess		          = objWMIService.ExecQuery ("Select DeviceID from Win32_Printer")

' create an array over all the WMI objects, we actially only need the IdentifyingNumber.
' since this is unique we can use this in zabbix in an object.
' wmi.get["root\cimv2","SELECT Caption FROM Win32_Process WHERE IdentifyingNumber = '{#NAME}'"]

' function to make SJON compatible.
Function MakeSJONCompatible(value)
  ' first let check if the value is null
  nullValue = IsNull(value)
  If nullValue = false Then 
    value = Replace(value,"\","\\")    ' replace \ with \\
    value = Replace(value,"""","\""")  ' replace " with \"
  End if
  MakeSJONCompatible = value
End Function


For each objProcess in colProcess
  jsonValue = jsonValue & "{""{#WMIDEVICEID}"":"""           & MakeSJONCompatible(objProcess.DeviceID)          & """},"
  
Next


JSONBegin = "{""data"":["     ' JSON begin
JSONEnd   = "]}"              ' JSON end.

' lets create the full JSON value.
createJSON = JSONBegin & jsonValue & JSONEnd
' since the array adds an "," at the end of each IdentifyingNumber we will remove it here.
' so the end will have an valid JSON  value.
createJSON = Replace(createJSON,",]}","]}")






JSONFinal = createJSON

' finally lets print the value.
wscript.echo JSONFinal


