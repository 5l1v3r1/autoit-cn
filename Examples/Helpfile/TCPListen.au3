;服务端!! 先运行我 !!!!!!!!!!!!!!!
Local $g_IP = "127.0.0.1"

; 开始 TCP 服务
;==============================================
TCPStartup()

; 创建一个套接字(SOCKET)监听
;==============================================
Local $MainSocket = TCPListen($g_IP, 65432, 100)
If $MainSocket = -1 Then Exit
