EnableExplicit
Define depth, depthBefore, inc
Define a

If OpenFile(0, "input.txt")
	Repeat
		depthBefore = depth
		depth = Val(ReadString(0))
		Debug depth
		If depthBefore And depth > depthBefore
			inc +1
		EndIf        
	Until Eof(0)
	CloseFile(0)
EndIf
Debug inc 
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 15
; EnableXP
; CompileSourceDirectory