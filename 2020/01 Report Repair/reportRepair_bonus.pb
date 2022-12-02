EnableExplicit

Define tempString.s
NewList a()
NewList b()
NewList c()


If ReadFile(0, "input.txt")
	While Not Eof(0)
		tempString = ReadString(0)
		AddElement(a())
		a() = Val(tempString)
	Wend
	CloseFile(0)
EndIf

CopyList(a(), b())
CopyList(a(), c())

Repeat
	ForEach a()
		ForEach b()
			ForEach c()
				If ListIndex(a()) <> ListIndex(b()) And ListIndex(a()) <> ListIndex(c()) And ListIndex(b()) <> ListIndex(c())
					If a() + b() + c() = 2020
						Debug a() * b() * c()
						Break 4
					EndIf
				EndIf
			Next
		Next
	Next
ForEver

End
; IDE Options = PureBasic 5.72 (Windows - x64)
; CursorPosition = 26
; EnableXP