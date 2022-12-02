EnableExplicit

Define tempString.s
Define curNr.i
NewList nr()

If ReadFile(0, "input.txt")
	While Not Eof(0)
		tempString = ReadString(0)
		AddElement(nr())
		nr() = Val(tempString)
	Wend
	CloseFile(0)
EndIf

Repeat
	FirstElement(nr())
	curNr = nr()
	DeleteElement(nr())
	ForEach nr()
		If curNr+nr() = 2020
			Debug curNr*nr()
			Break 2
		EndIf
	Next
ForEver

End
; IDE Options = PureBasic 5.72 (Windows - x64)
; CursorPosition = 15
; EnableXP