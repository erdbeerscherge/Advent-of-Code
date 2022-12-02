EnableExplicit
Define i, backTrack
Define input$
NewList chunkSegment.i()
NewList score()
Dim countCorrupted(4)
Define *restoreSegment
Define closingChunk
Define isCorrupted


If OpenFile(0, "input.txt")
	Repeat
		input$ = ReadString(0)
		ClearList(chunkSegment())
		For i = 1 To Len(input$)
			AddElement(chunkSegment())
			Select Mid(input$, i, 1)
				Case "("	:	chunkSegment() = -1
				Case "["	:	chunkSegment() = -2
				Case "{"	:	chunkSegment() = -3
				Case "<"	:	chunkSegment() = -4
					
				Case ")"	:	chunkSegment() = 1
				Case "]"	:	chunkSegment() = 2
				Case "}"	:	chunkSegment() = 3
				Case ">"	:	chunkSegment() = 4
			EndSelect
		Next
		isCorrupted = #False
		ForEach chunkSegment()
			If chunkSegment() > 0
				*restoreSegment = @chunkSegment()
				closingChunk = chunkSegment()
				For backTrack = ListIndex(chunkSegment()) To 0 Step -1
					SelectElement(chunkSegment(), backTrack)
					If chunkSegment() < 0
						If Abs(closingChunk) <> Abs(chunkSegment())
							countCorrupted(closingChunk) +1
							isCorrupted = #True
							Break 2
						Else
							DeleteElement(chunkSegment())
							ChangeCurrentElement(chunkSegment(), *restoreSegment)
							DeleteElement(chunkSegment())
							Break
						EndIf
					EndIf
				Next
			EndIf
		Next
		If Not isCorrupted
			AddElement(score())
			LastElement(chunkSegment())
			Repeat
				score() *5
				score() + (chunkSegment()*-1)
			Until PreviousElement(chunkSegment()) = #Null
		EndIf
	Until Eof(0)
	
    CloseFile(0)
EndIf

SortList(score(), #PB_Sort_Ascending)
SelectElement(score(), ListSize(score())/2)
Debug score()
End
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 54
; FirstLine = 33
; EnableXP
; CompileSourceDirectory