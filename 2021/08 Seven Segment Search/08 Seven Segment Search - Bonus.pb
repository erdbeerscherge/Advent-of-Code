EnableExplicit
Declare filterNumber(*this, index, elements, keyElements)
Define i, index, iBefore
Define input$, search$, number$, readDigit
Define identified, sum

Structure OUTPUT
	signal$[10]
	digit$[4]
EndStructure
Global NewList output.OUTPUT()

If OpenFile(0, "input.txt")
	Repeat
		input$ = ReadString(0)
		i = 0
		iBefore = 0
		readDigit = #False
		index = 0
		AddElement(output())
		Repeat
			i +1
			search$ = Mid(input$, i, 1)
			If (search$ = "" Or search$ = " ")
				number$ = Mid(input$, iBefore+1, (i-1)-iBefore)
				If number$ = "|"
					readDigit = #True
					index = -1				;reset
				Else
					If readDigit
						output()\digit$[index] = number$
					Else	:	output()\signal$[index] = number$
					EndIf
				EndIf
				iBefore = i
				index +1
			EndIf
		Until search$ = ""
	Until Eof(0)
	CloseFile(0)
EndIf



ForEach output()
	number$ = ""
	For index = 0 To 3
		Select Len(output()\digit$[index])
			Case 2	:	number$  +"1"
			Case 3	:	number$  +"7"
			Case 4	:	number$  +"4"
				
				
			Case 5
				identified = #False		;	;3, 2 oder 5
				If filterNumber(@output(), index, 2, 2)	;1er-Elemente suchen um 3 zu identifizieren
					number$  +"3"
					identified = #True
				EndIf
				If Not identified	;2 oder 5
					If filterNumber(@output(), index, 4, 3)	;4er-Elemente suchen um 5 zu identifizieren
						identified = #True
						number$ +"5"
					EndIf
				EndIf
				If Not identified
					number$  +"2"
				EndIf
				
				
			Case 6
				identified = #False		;9, 0, oder 6
				If filterNumber(@output(), index, 4, 4) ;4er-Elemente suchen um 9 zu identifizieren
					identified = #True
					number$ +"9"
				EndIf
				If Not identified	;0 oder 6
					If filterNumber(@output(), index, 2, 2) ;1er-Elemente suchen um 0 zu identifizieren
						identified = #True
						number$ +"0"
					EndIf
				EndIf
				If Not identified
					number$  +"6"
				EndIf
				
				
			Case 7	:	number$  +"8"
		EndSelect
	Next
	sum + Val(number$)
Next
Debug sum


Procedure filterNumber(*this.OUTPUT, index, elements, keyElements)
	Define i, ii, count
	For i = 0 To 9
		If Len(output()\signal$[i]) = elements	;1er-Elemente suchen um 3 zu identifizieren
			count = 0
			For ii = 1 To Len(output()\signal$[i])
				If FindString(*this\digit$[index], Mid(*this\signal$[i], ii, 1))
					count +1
				EndIf
			Next
			If count = keyElements
				ProcedureReturn #True
			EndIf
		EndIf
	Next	
	ProcedureReturn #False
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 18
; Folding = -
; EnableXP
; CompileSourceDirectory