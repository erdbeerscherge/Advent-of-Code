EnableExplicit

Define score
NewList readLine$()
Define.s line$
If ReadFile(0, "input.txt")
	Repeat
		line$ = ReadString(0)
		AddElement(readLine$())
		readLine$() = ReadString(0)
	Until Eof(0)
	CloseFile(0)
EndIf

Debug score
End

; IDE Options = PureBasic 6.03 LTS (Windows - x64)
; CursorPosition = 7
; Optimizer
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory