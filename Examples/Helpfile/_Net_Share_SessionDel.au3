 
 #include  <GuiConstantsEx.au3> 
 #include  <NetShare.au3> 
 #include  <WindowsConstants.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 Global  $iMemo 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $sServer 
 
     ; 创建界面 
     $hGUI  =  GUICreate ( "NetShare" ,  400 ,  300 ) 
 
     ; 创建memo控件 
     $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  396 ,  296 ,  $WS_VSCROLL ) 
     GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
     GUISetState () 
 
     ; 获取服务器及共享信息 
     $sServer  =  InputBox ( "NetWork Demo" ,  "Enter Server Name:" ,  "\\MyServer" ,  "" ,  200 ,  130 ) 
     If  @error  Then  Exit 
 
     ; 删除服务器上所有的本次会话 
     _Net_Share_SessionDel  ( $sServer ,  @ComputerName ) 
     MemoWrite ( "Error ...................: "  &  @error ) 
 
     ; 循环至用户退出 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 ; 向memo控件写入信息 
 Func MemoWrite ( $sMessage  =  "" ) 
     GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
 EndFunc    ;==>MemoWrite 
 
