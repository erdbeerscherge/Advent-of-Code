EnableExplicit
Define l, index
Define letter$
Define count
Dim countSeg(7)
Dim line$(0)

If OpenFile(0, "input.txt")
    Repeat
        ReDim line$(index)
        line$(index) = ReadString(0)
        index +1
    Until Eof(0)
    CloseFile(0)
EndIf

For l = 0 To ArraySize(line$())
    count = 0
    index = FindString(line$(l), "|")
    Repeat
        letter$ = Mid(line$(l), index, 1)
        If letter$ = "" Or letter$ = " "
            countSeg(count) +1
            count = 0
        Else    :    count +1
        EndIf
        index +1
    Until letter$ = ""
Next

count = 0
For index = 1 To 7
    If countSeg(index)
        Select index
            Case 2, 3, 4, 7    :    count+countSeg(index)
        EndSelect
    EndIf
Next
Debug count
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 38
; EnableXP
; CompileSourceDirectory