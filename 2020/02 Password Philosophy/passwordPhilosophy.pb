EnableExplicit

Define letter.s
Define password.s
Define min, max
Define hyphenIndex, spaceIndex, colonIndex
NewList lineString.s()

If ReadFile(0, "input.txt")
	While Not Eof(0)
		AddElement(lineString())
		lineString() = ReadString(0)
	Wend
	CloseFile(0)
EndIf

ForEach lineString()
	hyphenIndex = FindString(lineString(), "-", 1, #PB_String_NoCase)
	min = Val(Mid(lineString(), 1, hyphenIndex-1))
	
	spaceIndex = FindString(lineString(), " ", 1, #PB_String_NoCase)
	max = Val(Mid(lineString(), hyphenIndex+1, spaceIndex-1))
	
	colonIndex = FindString(lineString(), ":", 1, #PB_String_NoCase)
	letter = Mid(lineString(), colonIndex-1, 1)
	
	password = Mid(lineString(), colonIndex+2, Len(lineString())-colonIndex-1)
	
	If CountString(password, letter) < min Or CountString(password, letter) > max
		DeleteElement(lineString())
	EndIf
Next

Debug ListSize(lineString())
; IDE Options = PureBasic 5.72 (Windows - x64)
; CursorPosition = 2
; EnableXP