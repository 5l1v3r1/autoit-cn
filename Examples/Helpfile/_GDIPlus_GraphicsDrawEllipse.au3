 
 #include  <GuiConstantsEx.au3> 
 #include  <GDIPlus.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $hWnd ,  $hGraphic 
 
     ; 创建界面 
     $hGUI  =  GUICreate ( "GDI+" ,  400 ,  300 ) 
     $hWnd  =  WinGetHandle ( "GDI+" ) 
     GUISetState () 
 
     ; 绘制椭圆 
     _GDIPlus_Startup  () 
     $hGraphic  =  _GDIPlus_GraphicsCreateFromHWND  ( $hWnd ) 
     _GDIPlus_GraphicsDrawEllipse  ( $hGraphic ,  130 ,  100 ,  140 ,  70 ) 
 
     ; 循环至用户退出 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
     ; 清除资源 
     _GDIPlus_GraphicsDispose  ( $hGraphic ) 
     _GDIPlus_Shutdown  () 
 
 EndFunc    ;==>_Main  

