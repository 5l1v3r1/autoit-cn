﻿Local $x = BitRotate(7, 2)
; x == 28 因为 111b 左移两次是 1 1100b == 28

Local $y = BitRotate(14, -2)
; y == 32771 因为 1110b 右移两次在16位下为 1000 0000 0000 0011b == 32771

Local $z = BitRotate(14, -2, "D")
; z == -2147483645 因为 1110b 右移两次在16位下为 1000 0000 0000 0000 0000 0000 0000 0011b == 2147483645

MsgBox(4096, "BitRotate", "X=" & $x & @CRLF & @CRLF & "Y=" & $y & @CRLF & @CRLF & "Z=" & $z)