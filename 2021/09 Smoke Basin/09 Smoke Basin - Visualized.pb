EnableExplicit
Define input$
Define x, y
Dim caveMap(x, y)
Define screen
Define colorLevel
#tileSize = 5


If OpenFile(0, "input.txt")
	Repeat
		input$ = ReadString(0)
		If y = 0
			Dim caveMap(Len(input$)-1, y)
		Else	:	ReDim caveMap(Len(input$)-1, y)
		EndIf
		For x = 0 To Len(input$)-1
			caveMap(x, y) = Val(Mid(input$, x+1, 1))
		Next
		y+1
    Until Eof(0)
	
    CloseFile(0)
EndIf

screen = OpenWindow(#PB_Any, #PB_Ignore, #PB_Ignore, ArraySize(caveMap(), 1)*#tileSize, ArraySize(caveMap(), 2)*#tileSize, "AoC 2021-09: Smoke Basin", #PB_Window_ScreenCentered | #PB_Window_SystemMenu)
Repeat
	If StartDrawing(WindowOutput(screen))
		For x = 0 To ArraySize(caveMap(), 1)-1
			For y = 0 To ArraySize(caveMap(), 2)-1
				colorLevel = (((caveMap(x, y)*100)/9)*255)/100
				Box(x*#tileSize, y*#tileSize, #tileSize, #tileSize, RGB(0, colorLevel, colorLevel))
			Next
		Next
		StopDrawing()
	EndIf
Until WaitWindowEvent(16) = #PB_Event_CloseWindow
End


; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 6
; EnableXP
; CompileSourceDirectory