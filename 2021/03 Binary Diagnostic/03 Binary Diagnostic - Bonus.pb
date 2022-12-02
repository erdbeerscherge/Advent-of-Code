EnableExplicit
Declare convertBinary(value$)
Define index, lifeSupport
NewList rawData$()
NewList currentRating$()
Define.f countOne
Dim rating(1)
Define.s criteria$


If OpenFile(0, "input.txt")
	Repeat
		AddElement(rawData$())
    	rawData$() = ReadString(0)
    Until Eof(0)
    CloseFile(0)
EndIf

For lifeSupport = 0 To 1
	CopyList(rawData$(), currentRating$())
	index = 1
	Repeat
		countOne = 0
		ForEach currentRating$()
			If Mid(currentRating$(), index, 1) = "1"
				countOne +1
			EndIf
		Next
		Debug countOne
		criteria$ = "0"
		Select lifeSupport
			Case 0
				If countOne >= ListSize(currentRating$())/2 	
					criteria$ = "1"
				EndIf
			Case 1
				If countOne < ListSize(currentRating$())/2 	
					criteria$ = "1"
				EndIf			
		EndSelect
		
		ForEach currentRating$()
			If Mid(currentRating$(), index, 1) <> criteria$
				DeleteElement(currentRating$())
				If ListSize(currentRating$()) = 1
					Break 2
				EndIf
			EndIf
		Next
		index +1
	ForEver
	FirstElement(currentRating$())
	rating(lifeSupport) = convertBinary(currentRating$())
Next
Debug rating(0) * rating(1)
End





Procedure convertBinary(value$)
	Define i, nr
	For i = 1 To Len(value$)
		If Mid(value$, i, 1) = "1"
			nr + Pow(2, Len(value$)-i)
		EndIf
	Next
	ProcedureReturn nr
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 28
; Folding = -
; EnableXP
; CompileSourceDirectory