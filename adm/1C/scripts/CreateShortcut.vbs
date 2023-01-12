'����� ������� ������� �������� ���������, ����: tvs-sm.ru, e-mail tvs-sm@ya.ru
'
Set oWS = WScript.CreateObject("WScript.Shell")
Set WshShell = WScript.CreateObject("WScript.Shell")
Set FSO=CreateObject("Scripting.FileSystemObject")

Set Args = WScript.Arguments

DesktopPath = WshShell.SpecialFolders("Desktop")
ScriptPath = FSO.GetParentFolderName(WScript.ScriptFullName)

if Args.Count() < 1 Then
   HelpMessage = "������� CreateShortcut.vbs ����� ������������ ���������."&vbCrLf& _
   "��� ��������� �������� � ������� ��������"&vbCrLf& _
   "- 1� �������� ���� � ������� ������"&vbCrLf& _
   "- 2� �������� ��� ��������� ������� � ����� ��������"&vbCrLf& _
   "- 3� �������� ��� ������ - ���� �� ������� ��� ������ ����� = ����� ������� ������ (�� ������� ���������)"&vbCrLf& _
   "- 4� ���� � ����� ������ � ��  ����� ����� �������"&vbCrLf& _
   "- 5� ���� � ����� ���������� ���������� ������, ���� �� ����� �� �� ��������� ����� ����������� ����� � ���� ��������. ���� �������� %DESKTOP% �� �������� �� ������� ����� �������� ������������."&vbCrLf& _
   ""&vbCrLf& _
   "������ ������� �������: "&vbCrLf& _
   "CreateShortcut.vbs ""D:\Adm\Sysinternals\Procmon64.exe"" ""/quiet /minimized"" ""��������� ����� x64"" "&vbCrLf& _
   "���������� �������� ������ ������� ��������."

   MsgBox(HelpMessage)
   WScript.Quit
end if

'CreateShortcut.vbs "D:\Adm\Sysinternals\Procmon64.exe" "/quiet" "��������� ����� x64" "" %DESKTOP%

TargetLnkPath = Args.Item(0) '1� �������� ���� � ������� ������
Arguments = Args.Item(1)     '2� �������� ��������� ������� � ����� ��������

FolderOfLinkedObject = FSO.GetParentFolderName(TargetLnkPath)
'MsgBox(TargetLnkPath)

if Args.Count() >= 3 and Args.Item(2) <> "" Then
   NameLink = Args.Item(2) '3� �������� ��� ������  
else '��� ������ �� ������
   NameLink = FSO.GetBaseName(FSO.GetFile(TargetLnkPath))
end if
MsgBox(NameLink)

if Args.Count() >= 4 and Args.Item(3) <> "" Then
   IconLocation = Args.Item(3) '4� ���� � ����� ������ � ��  ����� ����� �������
else '���� � ������ �� ����� ������������ ������ ������ �� ����� �� ������� �������� �����
   IconLocation = TargetLnkPath + ", 0"
end if

if Args.Count() >= 5 and Args.Item(4) <> "" Then '5� ���� � ����� ���������� ���������� ������, ���� �� ����� �� �� ��������� ����� ����������� ����� � ���� ��������
   if Args.Item(4) = "%DESKTOP%" Then
      sLinkFile = DesktopPath + "\" + NameLink + ".lnk"
   else   
      sLinkFile = Args.Item(4) + "\" + NameLink + ".lnk"
   end if
else 
   sLinkFile = ScriptPath + "\" + NameLink + ".lnk"
end if
'MsgBox(sLinkFile)

Description = ""


Set oLink = oWS.CreateShortcut(sLinkFile)
    oLink.TargetPath = TargetLnkPath
   oLink.Arguments = Arguments
   oLink.Description = Description   
 '  oLink.HotKey = "ALT+CTRL+F"
   oLink.IconLocation = IconLocation
 '  oLink.WindowStyle = "1"   
   oLink.WorkingDirectory = FolderOfLinkedObject
oLink.Save
