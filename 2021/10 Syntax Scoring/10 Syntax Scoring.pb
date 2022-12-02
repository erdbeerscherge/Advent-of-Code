EnableExplicit
Define i, backTrack
Define input$
Dim chunkSegment(0)
Dim countCorrupted(4)
Define score

If OpenFile(0, "input.txt")
	Repeat
		input$ = ReadString(0)
		For i = 1 To Len(input$)
			ReDim chunkSegment(i-1)
			Select Mid(input$, i, 1)
				Case "("	:	chunkSegment(i-1) = -1
				Case "["	:	chunkSegment(i-1) = -2
				Case "{"	:	chunkSegment(i-1) = -3
				Case "<"	:	chunkSegment(i-1) = -4
					
				Case ")"	:	chunkSegment(i-1) = 1
				Case "]"	:	chunkSegment(i-1) = 2
				Case "}"	:	chunkSegment(i-1) = 3
				Case ">"	:	chunkSegment(i-1) = 4
			EndSelect
		Next
		For i = 0 To ArraySize(chunkSegment())
			If chunkSegment(i) > 0					;wenn closing chunk ...
				For backTrack = i To 0 Step -1
					If chunkSegment(backTrack) < 0	;... backtrack bis zum nächsten opening chunk
						If Abs(chunkSegment(i)) <> Abs(chunkSegment(backTrack))
							countCorrupted(chunkSegment(i)) +1
							Break 2
						Else
							chunkSegment(i) = 0
							chunkSegment(backTrack) = 0
							Break
						EndIf
					EndIf
				Next
			EndIf
		Next
	Until Eof(0)
	
	For i = 1 To 4
		Select i
			Case 1	:	score + countCorrupted(i)*3
			Case 2	:	score + countCorrupted(i)*57
			Case 3	:	score + countCorrupted(i)*1197
			Case 4	:	score + countCorrupted(i)*25137
		EndSelect
	Next
	
    CloseFile(0)
EndIf

Debug score
End
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 1
; EnableXP
; CompileSourceDirectory