EnableExplicit

Define pos, floor
Define readLine$

If ReadFile(0, "input.txt")
	readLine$ = ReadString(0)
	CloseFile(0)
EndIf

Debug CountString(readLine$, "(") - CountString(readLine$, ")")

;Bonus
For pos = 1 To Len(readLine$)
	Select Mid(readLine$, pos, 1)
		Case "("	:	floor +1
		Case ")"	:	floor -1
	EndSelect
	If floor = -1
		Debug pos
		Break
	EndIf
Next

End

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 24
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory