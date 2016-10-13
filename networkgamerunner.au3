#NoTrayIcon

#include "CopyWithProgress.au3"

If $CmdLine[0] < 1 Then
	MsgBox(64, 'gamecopy', 'no params')
	Exit
EndIf

If FileExists('\\'&$CmdLine[1]) = 0 Then
	MsgBox(64, 'gamecopy', 'path not found')
	Exit
EndIf

$attrib = FileGetAttrib($CmdLine[1])

If StringInStr($attrib, 'D') Then
	MsgBox(64, 'gamecopy', 'cannot run a directory')
	Exit
EndIf


$tokens = StringSplit($CmdLine[1], '\')

;if exists in the pc
;thelei allages na dw ti pernei to gamerunner ws parametrous.
If $tokens[0] >= 3 Then
	If $tokens[1] = 'nas' Then ;allagi!
		If $tokens[2] = 'network games' Then ;allagi
			;extra if statments?
			
			$pathC ='c:\'
			$pathCexe='c:\'
			$pathNas = '\\'

			For $i=2 To $tokens[0]-1
				$pathCexe = $pathCexe & $tokens[$i] & '\'
			Next

			$pathCexe =StringTrimRight($pathCexe,1)

			For $i=2 To 3
				$pathC=$pathC & $tokens[$i] & '\'
			Next

			$pathC =StringTrimRight($pathC,1)

			For $i = 1 To 3
				$pathNas = $pathNas & $tokens[$i] & '\'
			Next

			$pathNas = StringTrimRight($pathNas, 1)
		

			$cmdC = $pathCexe & '\' & $tokens[$tokens[0]]

			For $i = 2 To $CmdLine[0]
				$cmdC = $cmdC & $CmdLine[$i]
			Next

			;$cmdC = StringTrimRight($cmdC, 1)

			;MsgBox(64, 'pathC', $pathC)
			;MsgBox(64, 'pathNas', $pathNas)
			;MsgBox(64, 'pathCexe', $pathCexe)
			;MsgBox(64, 'cmdC', $cmdC)

			$res=True
			if FileExists($pathC)=0 Then
				$res = _CopyWithProgress($pathNas, $pathC)
				;res==1 success do u want t
			EndIf
			
			;mporei na thelei wait
			#comments-start
			While 1 
			   Sleep(10)
			   if Filegetsize($pathC) = Filegetsize($pathNas)then 
				  ExitLoop
			   Endif
			Wend
			#comments-end
			;If FileExists($pathC)=1 Then
			If $res Then
				RunAs('Gamer', @Computername, '***', 1, $cmdC, $pathCexe)
			Else
				DirRemove($pathC,1)
				MsgBox (64, 'ERROR' , 'The game transfer was unsuccessful. Please try again')
			EndIf

			;MsgBox(64, 'Copy', 'Metatorun')

			Exit

		EndIf
	EndIf
EndIf

MsgBox(64, 'gamecopy', 'forbidden path')