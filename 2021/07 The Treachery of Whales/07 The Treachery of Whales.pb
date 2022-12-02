EnableExplicit
Define.s fileIn$, search$
Define u, uBefore, index, pos
Define fuel, minFuel, burn
Dim uBoat(0)

If OpenFile(0, "input.txt")
	fileIn$ = ReadString(0)
	CloseFile(0)
EndIf
Repeat
	u +1
	search$ = Mid(fileIn$, u, 1)
	If search$ = "," Or search$ = ""
		ReDim uBoat(index)
		uBoat(index) = Val(Mid(fileIn$, uBefore+1, (u-1)-uBefore))
		index +1
		uBefore = u
	EndIf
Until search$ = ""

SortArray(uBoat(), #PB_Sort_Ascending)
For pos = 0 To uBoat(ArraySize(uBoat()))
	fuel = 0
	For u = 0 To ArraySize(uBoat())
		burn = Abs(uBoat(u)-pos)
		fuel + burn
;		fuel + ((burn+1)*burn*0.5)	;BONUS
	Next
	If minFuel = 0 Or fuel < minFuel
		minFuel = fuel
	EndIf
Next
Debug minFuel
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 26
; EnableXP
; CompileSourceDirectory