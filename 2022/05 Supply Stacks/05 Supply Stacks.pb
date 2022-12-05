EnableExplicit
Declare limit(value, min, max)

Define score
Define count, pos, maxPosition
Define.s readLine$
Structure CRATE
	content$
	position.i
	moveCount.i
	moveFrom.i
	moveTo.i
EndStructure
NewList crate.CRATE()
NewList instruction.CRATE()
If ReadFile(0, "input.txt")
	Repeat
		readLine$ = ReadString(0)
		If FindString(readLine$, "[")
			count = 0
			For pos = 2 To Len(readLine$) Step 4
				count +1
				If Mid(readLine$, pos, 1) <> " "
					AddElement(crate())
					crate()\content$ = Mid(readLine$, pos, 1)
					crate()\position = count
					If count > maxPosition
						maxPosition = count
					EndIf
				EndIf
			Next
		ElseIf FindString(readLine$, "move")
			AddElement(instruction())
			pos = FindString(readLine$, "move")+4
			instruction()\moveCount = Val(Mid(readLine$, pos, FindString(readLine$, "from")-pos))
			pos = FindString(readLine$, "from")+4
			instruction()\moveFrom = Val(Mid(readLine$, pos, FindString(readLine$, "to")-pos))
			pos = FindString(readLine$, "to")+2
			instruction()\moveTo = Val(Right(readLine$, Len(readLine$)-pos))
		EndIf
	Until Eof(0)
	CloseFile(0)
EndIf

;follow instructions
ForEach instruction()
	For count = 1 To instruction()\moveCount
		ForEach crate()
			If crate()\position = instruction()\moveFrom
				crate()\position = instruction()\moveTo
				MoveElement(crate(), #PB_List_First)
				Break
			EndIf
		Next
	Next
Next

;print solution
For pos = 1 To maxPosition
	ForEach crate()
		If crate()\position = pos
			Debug crate()\content$
			Break
		EndIf
	Next
Next

End

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 68
; FirstLine = 29
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory