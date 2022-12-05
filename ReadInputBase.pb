EnableExplicit

Define score
NewList readLine$()
Define.s readLine$
If ReadFile(0, "input.txt")
	Repeat
		readLine$ = ReadString(0)
		AddElement(readLine$())
		readLine$() = ReadString(0)
	Until Eof(0)
	CloseFile(0)
EndIf

Debug score
End

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 4
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory