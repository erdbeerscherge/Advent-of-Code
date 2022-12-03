EnableExplicit
UseMD5Fingerprint()
Define count
Repeat
	count +1
Until Left(StringFingerprint("yzbqklnj"+Str(count), #PB_Cipher_MD5), 5) = "00000"
Debug count
; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 6
; EnableXP
; SubSystem = DirectX9
; CompileSourceDirectory