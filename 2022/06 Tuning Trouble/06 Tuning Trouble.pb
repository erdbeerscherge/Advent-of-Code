EnableExplicit

Define pos, charCount, foundMarker
Define.s readLine$, section$
#sectionLength = 4				;set to 14 for solving Bonus
If ReadFile(0, "input.txt")
	Repeat
		readLine$ = ReadString(0)
	Until Eof(0)
	CloseFile(0)
EndIf

For pos = #sectionLength To Len(readLine$)
	section$ = Mid(readLine$, pos-(#sectionLength-1), #sectionLength)
	foundMarker = #True
	For charCount = 1 To #sectionLength-1
		If CountString(section$, Mid(section$, charCount, 1)) > 1
			foundMarker = #False
			Break
		EndIf
	Next
	If foundMarker
		Debug pos
		Break
	EndIf
Next
End

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 3
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory