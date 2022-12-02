EnableExplicit
Define.s fileIn$
Define i, maxEntry
Define gamma, epsilon
Dim column(0)

If OpenFile(0, "input.txt")
	Repeat
		maxEntry +1
    	fileIn$ = ReadString(0)
    	If Not ArraySize(column())
    		Dim column(Len(fileIn$))
    	EndIf
    	For i = 1 To ArraySize(column())
    		If Val(Mid(fileIn$, i, 1)) = 1
    			column(i) +1
    		EndIf
    	Next
    Until Eof(0)
    CloseFile(0)
EndIf
For i = 1 To ArraySize(column())
	If column(i) > maxEntry/2
		gamma + Pow(2, (ArraySize(column()))-i)
	Else
		epsilon + Pow(2, (ArraySize(column()))-i)
	EndIf
Next
Debug gamma*epsilon
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 27
; EnableXP
; CompileSourceDirectory