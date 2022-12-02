EnableExplicit
Define a, day, timer, count
Define.s fileIn$

Structure LANTERN_FISH
	timerID.b	;Byte
	count.q		;Quad
EndStructure
NewList lanternFish.LANTERN_FISH()

If OpenFile(0, "input.txt")
	fileIn$ = ReadString(0)
	a = 1
	Repeat
		timer = Val(Mid(fileIn$, a, 1))
		AddElement(lanternFish())
		lanternFish()\timerID = timer
		lanternFish()\count = 1			;single fish
		a +2
	Until Mid(fileIn$, a, 1) = ""
EndIf

For day = 1 To 256
	count = 0
	ForEach lanternFish()
		lanternFish()\timerID -1
		If lanternFish()\timerID = -1
			count +lanternFish()\count
			lanternFish()\timerID = 6
		EndIf
	Next
	If count
		AddElement(lanternFish())
		lanternFish()\timerID = 8
		lanternFish()\count = count		;group of fish
	EndIf
Next

count = 0
ForEach lanternFish()
	count + lanternFish()\count
Next
Debug count
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 42
; EnableXP
; CompileSourceDirectory