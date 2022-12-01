EnableExplicit

Define sum
Define readLine$
NewList elf()
If ReadFile(0, "input.txt")
	Repeat
		AddElement(elf())
		Repeat
			readLine$ = ReadString(0)
			If readLine$ = ""
				Break
			EndIf
			elf() + Val(readLine$)
		ForEver
	Until Eof(0)
	CloseFile(0)
EndIf

SortList(elf(), #PB_Sort_Descending)

;First Star:
FirstElement(elf())
Debug elf()

;Second Star:
ForEach elf()
	sum + elf()
	If ListIndex(elf()) = 2
		Break
	EndIf
Next
Debug sum
; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 32
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory