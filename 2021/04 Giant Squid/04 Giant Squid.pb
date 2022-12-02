EnableExplicit
Define.s fileIn$, search$
Define i, iBefore, index
Define x, y, count
Define sum

Structure BOARD
    entry.b[25]
    flag.b[25]
EndStructure
NewList board.BOARD()
NewList number()


If OpenFile(0, "input.txt")
    fileIn$ = ReadString(0)
    Repeat
        i +1
        search$ = Mid(fileIn$, i, 1)
        If search$ = "," Or search$ = ""
            AddElement(number())
            number() = Val(Mid(fileIn$, iBefore+1, (i-1)-iBefore))
            iBefore = i
        EndIf
    Until search$ = ""
    i = 0
    Repeat
        fileIn$ = ReadString(0)
        If fileIn$
            Repeat
                search$ = Mid(fileIn$, i, 3)
                If Len(search$)
                    board()\entry[index] = Val(search$)
                    index +1
                EndIf
                i +3
            Until search$ = ""
            i = 0
        Else
            AddElement(board())
            index = 0
        EndIf
    Until Eof(0)
    CloseFile(0)
EndIf

ForEach number()
    ForEach board()
        For i = 0 To 24
            If board()\entry[i] = number()
                board()\flag[i] = #True
                Break
            EndIf    
        Next    
        For x = 0 To 4
            count = 0            ;countRow
            For y = 0 To 4
                If board()\flag[(x*5)+y]
                    count +1
                EndIf
            Next
            If count = 5    :    Break 3    :    EndIf            
        Next
        For x = 0 To 4
            count = 0            ;countColumn
            For y = 0 To 24 Step 5
                If board()\flag[y+x]
                    count +1
                EndIf
            Next
            If count = 5    :    Break 3    :    EndIf                
        Next
    Next
Next

For i = 0 To 24
    If Not board()\flag[i]
        sum + board()\entry[i]
    EndIf
Next
Debug sum*number()
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 66
; FirstLine = 34
; EnableXP
; CompileSourceDirectory