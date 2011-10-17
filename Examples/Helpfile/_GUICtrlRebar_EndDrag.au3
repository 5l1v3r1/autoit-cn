 
 #include  <GuiConstantsEx.au3> 
 #include  <GuiReBar.au3> 
 #include  <GuiToolBar.au3> 
 #include  <WindowsConstants.au3> 
 #include  <Constants.au3> 
 
 Opt ( "MustDeclareVars" ,  1 ) 
 
 $Debug_RB  =  False 
 
 _Main () 
 
 Func _Main () 
     Local  $hgui ,  $btnExit ,  $hReBar ,  $hToolbar ,  $hInput ,  $btnBeginDrag 
     Local  Enum  $idNew  =  1000 ,  $idOpen ,  $idSave ,  $idHelp 
 
     $hgui  =  GUICreate ( "Rebar" ,  400 ,  396 ,  - 1 ,  - 1 ,  BitOR ( $WS_MINIMIZEBOX ,  $WS_CAPTION ,  $WS_POPUP ,  $WS_SYSMENU ,  $WS_MAXIMIZEBOX )) 
 
     ; 创建伸缩条控件 
     $hReBar  =  _GUICtrlReBar_Create ( $hgui ,  BitOR ( $CCS_TOP ,  $WS_BORDER ,  $RBS_VARHEIGHT ,  $RBS_AUTOSIZE ,  $RBS_BANDBORDERS )) 
     
     ; 创建置于伸缩条中的工具栏 
     $hToolbar  =  _GUICtrlToolBar_Create ( $hgui ,  BitOR ( $TBSTYLE_FLAT ,  $CCS_NORESIZE ,  $CCS_NOPARENTALIGN )) 
     
     ; 添加标准系统位图 
     Switch  _GUICtrlToolbar_GetBitmapFlags ( $hToolbar ) 
         Case  0 
             _GUICtrlToolbar_AddBitmap ( $hToolbar ,  1 ,  - 1 ,  $IDB_STD_SMALL_COLOR ) 
         Case  2 
             _GUICtrlToolbar_AddBitmap ( $hToolbar ,  1 ,  - 1 ,  $IDB_STD_LARGE_COLOR ) 
     EndSwitch 
 
     ; 添加按钮 
     _GUICtrlToolbar_AddButton ( $hToolbar ,  $idNew ,  $STD_FILENEW ) 
     _GUICtrlToolbar_AddButton ( $hToolbar ,  $idOpen ,  $STD_FILEOPEN ) 
     _GUICtrlToolbar_AddButton ( $hToolbar ,  $idSave ,  $STD_FILESAVE ) 
     _GUICtrlToolbar_AddButtonSep ( $hToolbar ) 
     _GUICtrlToolbar_AddButton ( $hToolbar ,  $idHelp ,  $STD_HELP ) 
 
     ; 创建置于伸缩条中的输入框 
     $hInput  =  GUICtrlCreateInput ( "Input control" ,  0 ,  0 ,  120 ,  20 ) 
 
     ; 添加包含控件的区段 
     _GUICtrlReBar_AddBand ( $hReBar ,  GUICtrlGetHandle ( $hInput ),  120 ,  200 ,  "Name:" ) 
     
     ; 在伸缩条起点添加包含控件的区段 
     _GUICtrlReBar_AddToolBarBand ( $hReBar ,  $hToolbar ,  "" ,  0 ) 
     
 
     $btnBeginDrag  =  GUICtrlCreateButton ( "Begin Drag" ,  150 ,  330 ,  100 ,  25 ) 
     $btnExit  =  GUICtrlCreateButton ( "Exit" ,  150 ,  360 ,  100 ,  25 ) 
     GUISetState ( @SW_SHOW ) 
 
     While  1 
         Switch  GUIGetMsg () 
             Case  $GUI_EVENT_CLOSE ,  $btnExit 
                 Exit 
             Case  $btnBeginDrag 
                 _GUICtrlRebar_BeginDrag ( $hReBar ,  0 ) 
                 _GUICtrlRebar_DragMove ( $hReBar ) 
                 _GUICtrlRebar_EndDrag ( $hReBar ) 
         EndSwitch 
     WEnd 
 EndFunc    ;==>_Main 
 
