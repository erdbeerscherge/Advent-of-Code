EnableExplicit
Define a, count, day
Define.s fileIn$

NewList lanternFish()

If OpenFile(0, "input.txt")
    fileIn$ = ReadString(0)
    a = 1
    Repeat
        AddElement(lanternFish())
        lanternFish() = Val(Mid(fileIn$, a, 1))
        a +2
    Until Mid(fileIn$, a, 1) = ""
EndIf
For day = 1 To 80
    count = 0
    ForEach lanternFish()
        lanternFish() -1
        If lanternFish() = -1
            count +1
            lanternFish() = 6
        EndIf
    Next
    For a = 1 To count
        AddElement(lanternFish())
        lanternFish() = 8
    Next
Next
Debug ListSize(lanternFish())
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 29
; EnableXP
; CompileSourceDirectory