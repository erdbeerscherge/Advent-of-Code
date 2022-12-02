EnableExplicit
Define input$
Define dir
Define x, y
Dim caveMap(x, y)
Define count

Global.b Dim xMod(3)
Global.b Dim yMod(3)
Restore dir_data
For dir = 0 To 3
	Read.b xMod(dir)
	Read.b yMod(dir)
Next

Structure LOCATION
	size.i
	x.b
	y.b
EndStructure
NewList coord.LOCATION()
NewList basin.LOCATION()
Define *this.LOCATION

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

For y = 0 To ArraySize(caveMap(), 2)
	For x = 0 To ArraySize(caveMap(), 1)
		If caveMap(x, y) < 9 And caveMap(x, y) > -1
			AddElement(coord())
			coord()\x = x
			coord()\y = y
			caveMap(x, y) = -1
			count = 1
			Repeat
				FirstElement(coord())
				*this = @coord()
				For dir = 0 To 3
					If *this\x+xMod(dir) >= 0 And *this\x+xMod(dir) <= ArraySize(caveMap(), 1) And
					   *this\y+yMod(dir) >= 0 And *this\y+yMod(dir) <= ArraySize(caveMap(), 2)
						If caveMap(*this\x+xMod(dir), *this\y+yMod(dir)) > -1 And caveMap(*this\x+xMod(dir), *this\y+yMod(dir)) < 9
							AddElement(coord())
							coord()\x = *this\x+xMod(dir)
							coord()\y = *this\y+yMod(dir)
							caveMap(*this\x+xMod(dir), *this\y+yMod(dir)) = -1
							count +1
						EndIf
					EndIf
				Next
				ChangeCurrentElement(coord(), *this)
				DeleteElement(coord())
			Until ListSize(coord()) = #Null
			AddElement(basin())
			basin()\size = count
		EndIf
	Next
Next

SortStructuredList(basin(), #PB_Sort_Descending, OffsetOf(LOCATION\size), TypeOf(LOCATION\size))
count = 1
ForEach basin()
	count * basin()\size
	If ListIndex(basin()) = 2
		Break
	EndIf
Next
Debug count
End

DataSection
dir_data:
	Data.b 0,-1	;north
	Data.b -1,0	;west
	Data.b 1,0	;east
	Data.b 0,1	;south
EndDataSection


; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 52
; FirstLine = 16
; EnableXP
; CompileSourceDirectory