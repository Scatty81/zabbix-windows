' ******************************************************************************
' zbx-getInstalledSoftware
' Author:   Rutger Hermarij
' email:    rutger.hermarij@Scatty.nl
' Date:     27-01-2015
' for:      ASICS Europe B.V.
' Version:  1.0
' Script created for Zabbix monitoring,

strComputer                 = "."                                               ' this computer
Set objWMIService           = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcess		          = objWMIService.ExecQuery ("Select * from Win32_Process")

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
  jsonValue = jsonValue & "{""{#WMICAPTION}"":"""                     & MakeSJONCompatible(objProcess.Caption)                     & ""","&_
                           """{#WMICOMMANDLINE}"":"""                 & MakeSJONCompatible(objProcess.CommandLine)                 & ""","&_
                           """{#WMICREATIONCLASSNAME}"":"""           & MakeSJONCompatible(objProcess.CreationClassName)           & ""","&_
                           """{#WMICAPTION}"":"""                     & MakeSJONCompatible(objProcess.Caption)                     & ""","&_
                           """{#WMICOMMANDLINE}"":"""                 & MakeSJONCompatible(objProcess.CommandLine)                 & ""","&_
                           """{#WMICREATIONCLASSNAME}"":"""           & MakeSJONCompatible(objProcess.CreationClassName)           & ""","&_
                           """{#WMICREATIONDATE}"":"""                & MakeSJONCompatible(objProcess.CreationDate)                & ""","&_
                           """{#WMICSCREATIONCLASSNAME}"":"""         & MakeSJONCompatible(objProcess.CSCreationClassName)         & ""","&_
                           """{#WMICSNAME}"":"""                      & MakeSJONCompatible(objProcess.CSName)                      & ""","&_
                           """{#WMIDESCRIPTION}"":"""                 & MakeSJONCompatible(objProcess.Description)                 & ""","&_
                           """{#WMIEXECUTABLEPATH}"":"""              & MakeSJONCompatible(objProcess.ExecutablePath)              & ""","&_
                           """{#WMIEXECUTIONSTATE}"":"""              & MakeSJONCompatible(objProcess.ExecutionState)              & ""","&_
                           """{#WMIHANDLE}"":"""                      & MakeSJONCompatible(objProcess.Handle)                      & ""","&_
                           """{#WMIHANDLECOUNT}"":"""                 & MakeSJONCompatible(objProcess.HandleCount)                 & ""","&_
                           """{#WMIINSTALLDATE}"":"""                 & MakeSJONCompatible(objProcess.InstallDate)                 & ""","&_
                           """{#WMIKERNELMODETIME}"":"""              & MakeSJONCompatible(objProcess.KernelModeTime)              & ""","&_
                           """{#WMIMAXIMUMWORKINGSETSIZE}"":"""       & MakeSJONCompatible(objProcess.MaximumWorkingSetSize)       & ""","&_
                           """{#WMIMINIMUMWORKINGSETSIZE}"":"""       & MakeSJONCompatible(objProcess.MinimumWorkingSetSize)       & ""","&_
                           """{#WMINAME}"":"""                        & MakeSJONCompatible(objProcess.Name)                        & ""","&_
                           """{#WMIOSCREATIONCLASSNAME}"":"""         & MakeSJONCompatible(objProcess.OSCreationClassName)         & ""","&_
                           """{#WMIOSNAME}"":"""                      & MakeSJONCompatible(objProcess.OSName)                      & ""","&_
                           """{#WMIOTHEROPERATIONCOUNT}"":"""         & MakeSJONCompatible(objProcess.OtherOperationCount)         & ""","&_
                           """{#WMIOTHERTRANSFERCOUNT}"":"""          & MakeSJONCompatible(objProcess.OtherTransferCount)          & ""","&_
                           """{#WMIPAGEFAULTS}"":"""                  & MakeSJONCompatible(objProcess.PageFaults)                  & ""","&_
                           """{#WMIPAGEFILEUSAGE}"":"""               & MakeSJONCompatible(objProcess.PageFileUsage)               & ""","&_
                           """{#WMIPARENTPROCESSID}"":"""             & MakeSJONCompatible(objProcess.ParentProcessId)             & ""","&_
                           """{#WMIPEAKPAGEFILEUSAGE}"":"""           & MakeSJONCompatible(objProcess.PeakPageFileUsage)           & ""","&_
                           """{#WMIPEAKVIRTUALSIZE}"":"""             & MakeSJONCompatible(objProcess.PeakVirtualSize)             & ""","&_
                           """{#WMIPEAKWORKINGSETSIZE}"":"""          & MakeSJONCompatible(objProcess.PeakWorkingSetSize)          & ""","&_
                           """{#WMIPRIORITY}"":"""                    & MakeSJONCompatible(objProcess.Priority)                    & ""","&_
                           """{#WMIPRIVATEPAGECOUNT}"":"""            & MakeSJONCompatible(objProcess.PrivatePageCount)            & ""","&_
                           """{#WMIPROCESSID}"":"""                   & MakeSJONCompatible(objProcess.ProcessId)                   & ""","&_
                           """{#WMIQUOTANONPAGEDPOOLUSAGE}"":"""      & MakeSJONCompatible(objProcess.QuotaNonPagedPoolUsage)      & ""","&_
                           """{#WMIQUOTAPAGEDPOOLUSAGE}"":"""         & MakeSJONCompatible(objProcess.QuotaPagedPoolUsage)         & ""","&_
                           """{#WMIQUOTAPEAKNONPAGEDPOOLUSAGE}"":"""  & MakeSJONCompatible(objProcess.QuotaPeakNonPagedPoolUsage)  & ""","&_
                           """{#WMIQUOTAPEAKPAGEDPOOLUSAGE}"":"""     & MakeSJONCompatible(objProcess.QuotaPeakPagedPoolUsage)     & ""","&_
                           """{#WMIREADOPERATIONCOUNT}"":"""          & MakeSJONCompatible(objProcess.ReadOperationCount)          & ""","&_
                           """{#WMIREADTRANSFERCOUNT}"":"""           & MakeSJONCompatible(objProcess.ReadTransferCount)           & ""","&_
                           """{#WMISESSIONID}"":"""                   & MakeSJONCompatible(objProcess.SessionId)                   & ""","&_
                           """{#WMISTATUS}"":"""                      & MakeSJONCompatible(objProcess.Status)                      & ""","&_
                           """{#WMITERMINATIONDATE}"":"""             & MakeSJONCompatible(objProcess.TerminationDate)             & ""","&_
                           """{#WMITHREADCOUNT}"":"""                 & MakeSJONCompatible(objProcess.ThreadCount)                 & ""","&_
                           """{#WMIUSERMODETIME}"":"""                & MakeSJONCompatible(objProcess.UserModeTime)                & ""","&_
                           """{#WMIVIRTUALSIZE}"":"""                 & MakeSJONCompatible(objProcess.VirtualSize)                 & ""","&_
                           """{#WMIWINDOWSVERSION}"":"""              & MakeSJONCompatible(objProcess.WindowsVersion)              & ""","&_
                           """{#WMIWORKINGSETSIZE}"":"""              & MakeSJONCompatible(objProcess.WorkingSetSize)              & ""","&_
                           """{#WMIWRITEOPERATIONCOUNT}"":"""         & MakeSJONCompatible(objProcess.WriteOperationCount)         & ""","&_
                           """{#WMIWRITETRANSFERCOUNT}"":"""          & MakeSJONCompatible(objProcess.WriteTransferCount)          &  """},"
  
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


