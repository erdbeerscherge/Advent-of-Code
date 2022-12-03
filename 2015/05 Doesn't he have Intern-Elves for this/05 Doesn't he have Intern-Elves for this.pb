EnableExplicit

Define a
Define countNice
Define isNice
Define count
NewList readLine$()
Define.s vowels$ = "aeiou"
Dim naughty$(3)
For a = 0 To 3
	Read.s naughty$(a)
Next
If ReadFile(0, "input.txt")
	Repeat
		AddElement(readLine$())
		readLine$() = ReadString(0)
	Until Eof(0)
	CloseFile(0)
EndIf

ForEach readLine$()
	isNice = 0
	count = 0
	For a = 1 To Len(vowels$)
		count + CountString(readLine$(), Mid(vowels$, a, 1))
	Next
	If count >= 3
		isNice +1
	EndIf
	For a = 2 To Len(readLine$())
		If Mid(readLine$(), a, 1) = Mid(readLine$(), a-1, 1)
			isNice +1
			Break
		EndIf
	Next
	For a = 0 To 3
		If FindString(readLine$(), naughty$(a))
			isNice = 0
			Break
		EndIf
	Next
	If isNice = 2
		countNice +1
	EndIf
Next
Debug countNice

;Bonus
countNice = 0
ForEach readLine$()
	isNice = 0
	For a = 1 To Len(readLine$())-1
		If FindString(readLine$(), Mid(readLine$(), a, 2), a+2)
			isNice +1
			Break
		EndIf
	Next
	For a = 2 To Len(readLine$())-1
		If Mid(readLine$(), a-1, 1) = Mid(readLine$(), a+1, 1)
			isNice +1
			Break
		EndIf
	Next
	If isNice = 2
		countNice +1
	EndIf
Next
Debug countNice

End

DataSection
	Data.s "ab", "cd", "pq", "xy"
EndDataSection

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 53
; FirstLine = 39
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory