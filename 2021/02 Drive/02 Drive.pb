EnableExplicit
Define pos, depth
Define.s fileIn$

If OpenFile(0, "input.txt")
    Repeat
    	fileIn$ = UCase(ReadString(0))
    	Select Left(fileIn$, 1)
    		Case "F"	:	pos + Val(Right(fileIn$, 1))
    		Case "D"	:	depth + Val(Right(fileIn$, 1))
    		Case "U"	:	depth - Val(Right(fileIn$, 1))
    	EndSelect
    Until Eof(0)
    CloseFile(0)
EndIf
Debug pos*depth


; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 17
; EnableXP
; CompileSourceDirectory