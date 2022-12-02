EnableExplicit
Define input$
Define dir
Define x, y
Dim caveMap(x, y)
Define isLow
Define riskLevel

Global.b Dim xMod(8)
Global.b Dim yMod(8)
Restore dir_data
For dir = 0 To 4
	Read.b xMod(dir)
	Read.b yMod(dir)
Next

If OpenFile(0, "input.txt")
	Repeat
		input$ = ReadString(0)
		If y = 0
			Dim caveMap(Len(input$)-1, y)
		Else	:	ReDim caveMap(Len(input$)-1, y)
		EndIf
		For x = 0 To Len(input$)-1
			caveMap(x, y) = Val(Mid(input$, x+1, 1))
		Next
		y+1
    Until Eof(0)
	
    CloseFile(0)
EndIf


For x = 0 To ArraySize(caveMap(), 1)
	For y = 0 To ArraySize(caveMap(), 2)
		isLow = #True
		For dir = 1 To 4 ; in alle 4 Richtungen schauen
			If x+xMod(dir) >= 0 And x+xMod(dir) <= ArraySize(caveMap(), 1) And
			   y+yMod(dir) >= 0 And y+yMod(dir) <= ArraySize(caveMap(), 2)
				If caveMap(x+xMod(dir), y+yMod(dir)) <= caveMap(x, y)
					isLow = #False
					Break
				EndIf
			EndIf
		Next
		If isLow
			riskLevel +caveMap(x, y)+1
		EndIf		
	Next
Next
Debug riskLevel


DataSection
dir_data:
	Data.b 0,0	;0
	Data.b 0,-1	;north
	Data.b -1,0	;west
	Data.b 1,0	;east
	Data.b 0,1	;south
EndDataSection


; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 37
; FirstLine = 29
; EnableXP
; CompileSourceDirectory