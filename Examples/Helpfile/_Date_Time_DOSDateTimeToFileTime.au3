 #include <GuiConstantsEx.au3> 
 #include <Date.au3> 
 #include <WindowsConstants.au3> 
 
 Global $iMemo 
 
 _Main() 
 
 Func _Main() 
   Local $hGUI , $pFileTime1 , $tFileTime1 , $pFileTime2 , $tFileTime2 
 
   ; 创建界面 
   $hGUI = GUICreate ( " Time ", 400 , 300 ) 
   $iMemo = GUICtrlCreateEdit ( "", 2 , 2 , 396 , 296 , $WS_VSCROLL ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
   GUISetState () 
 
   ; 比较FAT日期/时间 
   $tFileTime1 = _Date_Time_DosDateTimeToFileTime ( 0x3621 , 0x11EF ) ; 01/01/2007 02:15:30 
   $tFileTime2 = _Date_Time_DosDateTimeToFileTime ( 0x379F , 0x944A ) ; 12/31/2007 18:34:20 
   $pFiletime1 = DllStructGetPtr ( $tFileTime1 ) 
   $pFiletime2 = DllStructGetPtr ( $tFileTime2 ) 
 
   MemoWrite( " Result 1:  " & _Date_Time_CompareFileTime ( $pFileTime1 , $pFileTime2 )) 
   MemoWrite( " Result 2:  " & _Date_Time_CompareFileTime ( $pFileTime1 , $pFileTime1 )) 
   MemoWrite( " Result 3:  " & _Date_Time_CompareFileTime ( $pFileTime2 , $pFileTime1 )) 
 
   ; 循环至用户退出 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 
 EndFunc ;==>_Main 
 
 ; 向memo控件写入一行 
 Func MemoWrite ( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc ;==>MemoWrite 
 
