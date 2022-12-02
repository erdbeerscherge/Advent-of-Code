EnableExplicit

Structure PRESENT
	length.b
	width.b
	height.b
EndStructure
NewList present.PRESENT()
Define a, size
Define.s readLine$, value$
Define xPos, xPosBefore
Dim value(2)

If ReadFile(0, "input.txt")
	Repeat
		readLine$ = ReadString(0)
		AddElement(present())
		xPos = FindString(readLine$, "x")
		value$ = Left(readLine$, xPos-1)
		present()\length = Val(value$)
		
		xPosBefore = xPos+1
		xPos = FindString(readLine$, "x", xPosBefore)
		value$ = Mid(readLine$, xPosBefore, xPos-xPosBefore)
		present()\width = Val(value$)
		
		value$ = Right(readLine$, Len(readLine$)-xPos)
		present()\height = Val(value$)
	Until Eof(0)
	CloseFile(0)
EndIf

ForEach present()
	value(0) = (present()\length*present()\width)
	value(1) = (present()\length*present()\height)
	value(2) = (present()\width*present()\height)
	SortArray(value(), #PB_Sort_Ascending)
	For a = 0 To 2
		size + (2*value(a))
	Next
	size +value(0)
Next
Debug size

;Bonus (Ribbon Length)
size = 0
ForEach present()
	value(0) = (present()\length)
	value(1) = (present()\height)
	value(2) = (present()\width)
	SortArray(value(), #PB_Sort_Ascending)
	size + (2*value(0)) + (2*value(1))
	size + (present()\length*present()\height*present()\width)
Next
Debug size
End
; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 50
; FirstLine = 15
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory