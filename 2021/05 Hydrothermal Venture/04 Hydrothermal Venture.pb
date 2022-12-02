EnableExplicit
Define.s fileIn$
Global xMax, yMax
Define pos
Declare splitStringByChar(string$, char$, *thisX, *thisY)
Define filterDiagonals = #True
Define x, y, count

Structure VENTS
	x0.i
	y0.i
	x1.i
	y1.i
EndStructure
NewList vent.VENTS()


If OpenFile(0, "input.txt")
	Repeat
		fileIn$ = ReadString(0)
		AddElement(vent())
		pos = FindString(fileIn$, " -")
		splitStringByChar(Mid(fileIn$, 1, pos-1), ",", @vent()\x0, @vent()\y0)
		pos = FindString(fileIn$, "> ")
		splitStringByChar(Mid(fileIn$, pos+2, Len(fileIn$)-(pos+1)), ",", @vent()\x1, @vent()\y1)
		If filterDiagonals And vent()\x0 <> vent()\x1 And vent()\y0 <> vent()\y1
			DeleteElement(vent())
		EndIf
	Until Eof(0)
EndIf


Dim diagram(xMax, yMax)
ForEach vent()
	x = vent()\x0
	y = vent()\y0
	Repeat
		If diagram(x, y) = 1
			count +1
		EndIf
		diagram(x, y) +1
		If x = vent()\x1 And y = vent()\y1
			Break
		EndIf
		If vent()\x0 > vent()\x1	:	x -1	:	EndIf
		If vent()\x0 < vent()\x1	:	x +1	:	EndIf
		If vent()\y0 > vent()\y1	:	y -1	:	EndIf
		If vent()\y0 < vent()\y1	:	y +1	:	EndIf
	ForEver
Next
Debug count
End



Procedure splitStringByChar(string$, char$, *thisX.Integer, *thisY.Integer)
	Define pos
	pos = FindString(string$, char$)
	*thisX\i = Val(Mid(string$, 1, pos-1))
	*thisY\i = Val(Mid(string$, pos+1, Len(string$)-pos))
	If *thisX\i > xMax	:	xMax = *thisX\i	:	EndIf
	If *thisY\i > yMax	:	yMax = *thisY\i	:	EndIf
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 55
; FirstLine = 16
; Folding = -
; EnableXP
; CompileSourceDirectory