EnableExplicit

Declare addSector()

Define i
Global NewList lineString.s()
Global Dim mapString.s(0)
Define tobogganX, tobogganY
Dim countTrees(4)
Dim slopeX(4)
Dim slopeY(4)
For i = 0 To 4
	Read.b slopeX(i)
	Read.b slopeY(i)
Next

If ReadFile(0, "input.txt")
	While Not Eof(0)
		AddElement(lineString())
		lineString() = ReadString(0)
	Wend
	CloseFile(0)
EndIf

For i = 0 To 4
	tobogganX = 0
	tobogganY = 0
	Dim mapString.s(ListSize(lineString()))
	addSector()
	
	Repeat
		If tobogganX +slopeX(i) > Len(lineString())-1
			addSector()
		EndIf
		tobogganX + slopeX(i)
		tobogganY + slopeY(i)
		If Mid(mapString(tobogganY), tobogganX+1, 1) = "#"
			countTrees(i) +1
		EndIf
	Until tobogganY = ListSize(lineString())-1
	
	If i > 0
		countTrees(i) * countTrees(i-1)
	EndIf
Next

Debug countTrees(4)
End



Procedure addSector()
	ForEach lineString()
		mapString(ListIndex(lineString())) +lineString()
	Next
EndProcedure

DataSection
	Data.b 1,1
	Data.b 3,1
    Data.b 5,1
    Data.b 7,1
    Data.b 1,2
EndDataSection


DataSection
	Data.b 1,1
	Data.b 3,1
	Data.b 5,1
	Data.b 7,1
	Data.b 1,2
EndDataSection
; IDE Options = PureBasic 5.72 (Windows - x64)
; Folding = -
; EnableXP