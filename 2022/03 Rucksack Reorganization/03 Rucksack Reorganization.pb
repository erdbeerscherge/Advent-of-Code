EnableExplicit

Define sum
Define a, ruck, count
NewList readLine$()
Define.s itemPool$ = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
If ReadFile(0, "input.txt")
	Repeat
		AddElement(readLine$())
		readLine$() = ReadString(0)
	Until Eof(0)
	CloseFile(0)
EndIf

ForEach readLine$()
	For a = 1 To Len(itemPool$)
		If FindString(Left(readLine$(), Len(readLine$())/2), Mid(itemPool$, a, 1))
			If FindString(Right(readLine$(), Len(readLine$())/2), Mid(itemPool$, a, 1))
				sum + a
			EndIf
		EndIf
	Next
Next
Debug sum

;Bonus
sum = 0
Dim rucksack$(2)
ForEach readLine$()
	rucksack$(count) = readLine$()
	count +1
	If count = 3	;collect 3, then resolve rucksack's contents
		For a = 1 To Len(itemPool$)
			count = 0					;temporaryCount, indexing rucksacks within each group
			For ruck = 0 To 2
				If FindString(rucksack$(ruck), Mid(itemPool$, a, 1))
					count +1
				EndIf
			Next
			If count = 3
				sum + a
				Break
			EndIf
		Next
		count = 0	;reset counter
	EndIf
Next

Debug sum
End

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 39
; FirstLine = 23
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory