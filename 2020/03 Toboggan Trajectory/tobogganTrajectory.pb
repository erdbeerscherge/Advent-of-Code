EnableExplicit

Declare addSector()

Global NewList lineString.s()
Define tobogganX, tobogganY
Define countTrees

If ReadFile(0, "input.txt")
	While Not Eof(0)
		AddElement(lineString())
		lineString() = ReadString(0)
	Wend
	CloseFile(0)
EndIf
Global Dim mapString.s(ListSize(lineString()))


addSector()
Repeat
	If tobogganX +3 > Len(lineString())-1
		addSector()
	EndIf
	tobogganX +3
	tobogganY +1
	If Mid(mapString(tobogganY), tobogganX+1, 1) = "#"
		countTrees +1
	EndIf
Until tobogganY = ListSize(lineString())-1
Debug countTrees

End


Procedure addSector()
	ForEach lineString()
		mapString(ListIndex(lineString())) +lineString()
	Next
EndProcedure
; IDE Options = PureBasic 5.72 (Windows - x64)
; CursorPosition = 28
; Folding = -
; EnableXP