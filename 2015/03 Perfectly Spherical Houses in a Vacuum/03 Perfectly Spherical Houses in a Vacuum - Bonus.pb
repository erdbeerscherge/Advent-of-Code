;Bonus
EnableExplicit

Define a
Define readLine$
Define houseExists
Structure OBJECT
	x.i
	y.i
	presents.i
EndStructure
NewList house.OBJECT()
NewList santa.OBJECT()

If ReadFile(0, "input.txt")
	readLine$ = ReadString(0)
	CloseFile(0)
EndIf

AddElement(santa())	;Santa
AddElement(santa())	;Robo-Santa

AddElement(house())
house()\presents +2

For a = 1 To Len(readLine$)
	FirstElement(santa())
	If Mod(a, 2) = 0
		LastElement(santa())	;Robo-Santa
	EndIf
	Select Mid(readLine$, a, 1)
		Case "^"	:	santa()\y-1
		Case "<"	:	santa()\x-1
		Case ">"	:	santa()\x+1
		Case "v"	:	santa()\y+1
	EndSelect
	houseExists = #False
	ForEach house()
		If house()\x = santa()\x And house()\y = santa()\y
			houseExists = #True
			Break
		EndIf
	Next
	If Not houseExists
		AddElement(house())
		house()\x = santa()\x
		house()\y = santa()\y
	EndIf
	house()\presents+1
Next
Debug ListSize(house())

End

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 29
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory