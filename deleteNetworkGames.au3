#NoTrayIcon
#include <File.au3>


Func DeleteNetworkGames()

	$pathC='C:\network games'
	FileDelete($pathC)

	$Folders=_FileListToArray($pathC)

	For $i = 1 To $Folders[0]
		DirRemove($pathC&'\'&$Folders[$i],1)
	Next

EndFunc

DeleteNetworkGames()