#NoTrayIcon
#include <File.au3>


Func DeleteNetworkGames()

	$pathC='C:\network games'
	FileDelete($pathC)

	$Folders=_FileListToArray($pathC)
	
	If $Folders[0]>0
		For $i = 1 To $Folders[0]
			DirRemove($pathC&'\'&$Folders[$i],1)
		Next
	EndIf

EndFunc