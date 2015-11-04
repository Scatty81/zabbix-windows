' ******************************************************************************
' zbx-win32filesCreated.vbs
' Author:   Rutger Hermarij
' email:    rutger.hermarij@Scatty.nl
' Date:     22-10-2015
' Version:  1.0
' Script created for Zabbix monitoring
' zabbix usage:
' Name:                 Created files (INTERFACE\ENT\ERRORS\IN)
' Item:                 vbs.zbx-win32filesCreated["E:\INTERFACE\ENT\ERRORS\IN"]
' Type of information:  Numberic (Unasigned)
' Date Type:            Decimal


strComputer                 = "."                                               ' this computer
sFolder                     = Wscript.Arguments.Item(0)                      ' folder to monitor

Set objWMIService           = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set fso                     = CreateObject("Scripting.FileSystemObject")
Set folder                  = fso.GetFolder(sFolder)
Set files                   = folder.Files

' we have to create a counter for the files that are created.
' so we know how many files there are.
teller = 0
 For each folderIdx In files
   teller=teller+1
   ' wscript.echo folderIdx.Name
  Next

' since we only need the output, just print the output.
  wscript.echo teller
  