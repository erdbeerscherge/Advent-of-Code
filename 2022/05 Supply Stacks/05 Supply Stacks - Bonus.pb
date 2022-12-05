EnableExplicit
Declare limit(value, min, max)

Define score
Define count, a, maxPosition
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
			For a = 2 To Len(readLine$) Step 4
				count +1
				If Mid(readLine$, a, 1) <> " "
					AddElement(crate())
					crate()\content$ = Mid(readLine$, a, 1)
					crate()\position = count
					If count > maxPosition
						maxPosition = count
					EndIf
				EndIf
			Next
		ElseIf FindString(readLine$, "move")
			AddElement(instruction())
			a = FindString(readLine$, "move")+4
			instruction()\moveCount = Val(Mid(readLine$, a, FindString(readLine$, "from")-a))
			a = FindString(readLine$, "from")+4
			instruction()\moveFrom = Val(Mid(readLine$, a, FindString(readLine$, "to")-a))
			a = FindString(readLine$, "to")+2
			instruction()\moveTo = Val(Right(readLine$, Len(readLine$)-a))
		EndIf
	Until Eof(0)
	CloseFile(0)
EndIf

;follow instructions
ForEach instruction()
	For count = 1 To instruction()\moveCount
		ForEach crate()
			If crate()\position = instruction()\moveFrom
				crate()\position = 0	;tagged
				Break
			EndIf
		Next
	Next
	;moveTagged from behind
	For count = 1 To instruction()\moveCount
		For a = ListSize(crate())-1 To 0 Step-1
			SelectElement(crate(), a)
			If crate()\position = 0
				crate()\position = instruction()\moveTo
				MoveElement(crate(), #PB_List_First)
				Break
			EndIf
		Next
	Next
Next

;print solution
For a = 1 To maxPosition
	ForEach crate()
		If crate()\position = a
			Debug crate()\content$
			Break
		EndIf
	Next
Next
End
; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 57
; FirstLine = 40
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory