EnableExplicit
Define pos, depth, aim, x
Define.s fileIn$

If OpenFile(0, "input.txt")
    Repeat
    	fileIn$ = UCase(ReadString(0))
    	Select Left(fileIn$, 1)
    		Case "F"
    			x = Val(Right(fileIn$, 2))
    			pos +x
    			depth + (aim*x)
    		Case "D"	:	aim + Val(Right(fileIn$, 2))
    		Case "U"	:	aim - Val(Right(fileIn$, 2))
    	EndSelect
    Until Eof(0)
    CloseFile(0)
EndIf
Debug pos*depth

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 19
; EnableXP
; CompileSourceDirectory