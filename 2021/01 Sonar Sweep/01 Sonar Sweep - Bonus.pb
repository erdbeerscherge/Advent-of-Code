EnableExplicit
NewList depth()
Define index, count, depthSum, depthBefore, inc

If OpenFile(0, "input.txt")
    Repeat
        AddElement(depth())
        depth() = Val(ReadString(0))            
    Until Eof(0)
    CloseFile(0)
EndIf

Repeat
    depthBefore = depthSum
    depthSum = 0
    For count = index To index+2
        SelectElement(depth(), count)
        depthSum +depth()
    Next
    If depthBefore And depthSum > depthBefore
        inc +1
    EndIf
    index +1
Until ListIndex(depth())+1 = ListSize(depth())
Debug inc
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 24
; EnableXP
; CompileSourceDirectory