EnableExplicit

Define a
Define.s first$, last$
;
Define score
NewList readLine$()
Define.s line$
If ReadFile(0, "input.txt")
	Repeat
		line$ = ReadString(0)
		AddElement(readLine$())
		readLine$() = line$
	Until Eof(0)
	CloseFile(0)
EndIf

ForEach readLine$()
	first$ = "0"
	For a = 1 To Len(readLine$())
		If FindString("0123456789", Mid(readLine$(), a, 1))
			first$ = Mid(readLine$(), a, 1)
			Break
		EndIf
	Next
	last$ = "0"
	For a = Len(readLine$()) To 1 Step -1
		If FindString("0123456789", Mid(readLine$(), a, 1))
			last$ = Mid(readLine$(), a, 1)
			Break
		EndIf
	Next
	score+Val(first$+last$)
Next

Debug score
End

; IDE Options = PureBasic 6.03 LTS (Windows - x64)
; CursorPosition = 32
; Optimizer
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory