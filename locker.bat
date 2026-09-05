REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"  /f 
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Runonce"  /f 
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"  /f 
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"  /f 
REG DELETE "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run"  /f 
REG DELETE "HKEY_CURRENT_USER\Software\Classes\VirtualStore\MACHINE\SOFTWARE\Wow6432Node\TopLang\Desktop Lock Express"  /f 
REG DELETE "HKEY_CURRENT_USER\Software\TopLang\Desktop Lock Express"  /f 
REG DELETE "HKEY_CURRENT_USER\Software\TopLang\Desktop Lock Express\Registration"  /f 
REG DELETE "HKEY_CURRENT_USER\Software\TopLang\Desktop Lock Express"  /f 
REG DELETE "HKEY_CURRENT_USER\Software\TopLang\Desktop Lock Express\Registration"  /f 
REG DELETE "HKLM\System\CurrentControlSet\Services\BootDriver "  /f 
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Performances"  /f 
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\services\Performances"  /f 
RMDIR /s/q C:\Users\%UserName%\AppData\Roaming\Microsoft\Windows\Windows 
erase /Q C:\Users\%UserName%\AppData\Roaming\Microsoft\Windows 
RMDIR /s/q "C:\Users\%UserName%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" 
RMDIR /s/q "C:\Users\%UserName%\AppData\Local\DeskLock" 
mkdir "C:\Users\%UserName%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" 
erase /Q "C:\Users\%UserName%\Downloads" 
rename C:\Windows\Fonts\svchost.exe xuy_sosy.exe 
DEL /F /S /Q /A "C:\Windows\Fonts\svchost.exe" 
DEL /F /S /Q /A "C:\Windows\Fonts\xuy_sosy.exe" 
DEL /F /S /Q /A "C:\ProgramData\MySQL\*.*" 
RMDIR /s/q "C:\Users\%UserName%\Documents\results\" 
SetLocal EnableExtensions 
 
For /F "Tokens=2*" %%I In ('Reg Query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" /V ProfilesDirectory') Do Set Profiles=%%J 
Call Set Profiles=%Profiles% 
 
For /F "Delims=" %%I In ('Dir /B /AD-S-H "%Profiles%" ^| FindStr /V /B /I /C:"All Users"') Do ( 
  Del /F /S /Q "%Profiles%\%%I\Local Settings\Temp\*.*" 
  Del /F /S /Q "%Profiles%\%%I\Local Settings\Temporary Internet Files\*.*" 
 
  Del /F /S /Q "%Profiles%\%%I\AppData\Local\Temp\*.*" 
  Del /F /S /Q "%Profiles%\%%I\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*" 
) 
exit