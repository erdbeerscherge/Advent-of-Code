EnableExplicit

Enumeration 1
	#rock
	#paper
	#scissors
EndEnumeration
NewList readLine$()
Define isBonusTask = #True
Define opponent, you, score

If ReadFile(0, "input.txt")
	Repeat
		AddElement(readLine$())
		readLine$() = ReadString(0)
	Until Eof(0)
	CloseFile(0)
EndIf

ForEach readLine$()
	Select Left(readLine$(), 1)
		Case "A"	:	opponent = #rock
		Case "B"	:	opponent = #paper
		Case "C"	:	opponent = #scissors
	EndSelect
	If isBonusTask
		Select Right(readLine$(), 1)
			Case "X"	
				Select opponent	;mustLose
					Case #rock		:	you = #scissors
					Case #paper		:	you = #rock
					Case #scissors	:	you = #paper
				EndSelect
			Case "Y"	:	you = opponent	;mustDraw
			Case "Z"	
				Select opponent	;mustWin
					Case #rock		:	you = #paper
					Case #paper		:	you = #scissors
					Case #scissors	:	you = #rock
				EndSelect
		EndSelect
	Else
		Select Right(readLine$(), 1)
			Case "X"	:	you = #rock
			Case "Y"	:	you = #paper
			Case "Z"	:	you = #scissors
		EndSelect
	EndIf
	
	score + you	;symbolScoring
	If you = opponent	;draw
		score +3
	ElseIf (you = #rock And opponent = #scissors) Or
	       (you = #paper And opponent = #rock) Or
	       (you = #scissors And opponent = #paper)
		score +6	;win
	EndIf
Next

Debug score
End

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 8
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory