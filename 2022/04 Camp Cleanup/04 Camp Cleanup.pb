EnableExplicit

Define p
Define countFullOverlap, countAllOverlap
Define readLine$
Dim pair$(1)
Dim startSection(1)
Dim endSection(1)

If ReadFile(0, "input.txt")
	Repeat
		readLine$ = ReadString(0)
		pair$(0) = Left(readLine$, FindString(readLine$, ",")-1)
		pair$(1) = Right(readLine$, Len(readLine$)-FindString(readLine$, ","))
		For p = 0 To 1
			startSection(p) = Val(Left(pair$(p), FindString(pair$(p), "-")-1))
			endSection(p) = Val(Right(pair$(p), Len(pair$(p))-FindString(pair$(p), "-")))
		Next
		For p = 0 To 1
			If startSection(p) <= startSection(Int(Abs(p-1))) And endSection(p) >= endSection(Int(Abs(p-1)))
				countFullOverlap +1
				Break
			EndIf
		Next
		For p = 0 To 1
			If (startSection(p) <= startSection(Int(Abs(p-1))) And endSection(p) >= startSection(Int(Abs(p-1)))) Or
					(startSection(p) <= endSection(Int(Abs(p-1))) And endSection(p) >= endSection(Int(Abs(p-1))))
				countAllOverlap +1
				Break
			EndIf
		Next
	Until Eof(0)
	CloseFile(0)
EndIf

Debug countFullOverlap
Debug countAllOverlap
End

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 7
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory