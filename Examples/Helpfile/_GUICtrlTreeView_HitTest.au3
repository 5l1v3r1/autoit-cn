 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiTreeView.au3> 
 #include <GuiImageList.au3> 
 #include <WindowsConstants.au3> 
 
 Opt (' MustDeclareVars ', 1 ) 
 
 $Debug_TV = False ; 检查传递给函数的类名, 设置为真并使用另一控件的句柄观察其工作 
 
 Global $hImage , $hStateImage 
 
 _Main() 
 
 Func _Main() 
 
   Local $hItem [ 10 ], $hChildItem [ 30 ], $iYItem = 0 , $iYRand , $iXRand , $hTreeView 
   Local $iStyle = BitOR ( $TVS_EDITLABELS , $TVS_HASBUTTONS , $TVS_HASLINES , $TVS_LINESATROOT , $TVS_DISABLEDRAGDROP , $TVS_SHOWSELALWAYS ) 
 
   GUICreate ( "TreeView Hit Test" , 400 , 300 ) 
 
   $hTreeView = GUICtrlCreateTreeView ( 2 , 2 , 396 , 268 , $iStyle , $WS_EX_CLIENTEDGE ) 
   _GUICtrlTreeView_SetUnicodeFormat ( $hTreeView , True ) 
   GUISetState () 
 
   _CreateNormalImageList() 
   _GUICtrlTreeView_SetNormalImageList ( $hTreeView , $hImage ) 
 
   _CreateStateImageList() 
   _GUICtrlTreeView_SetStateImageList ( $hTreeView , $hStateImage ) 
 
   _GUICtrlTreeView_BeginUpdate ( $hTreeView ) 
   For $x = 0 To 9 
     $hItem [ $x ] = _GUICtrlTreeView_Add ( $hTreeView , 0 , StringFormat ( "[%02d] New Item" , $x ), 4 , 5 ) 
     _GUICtrlTreeView_SetStateImageIndex ( $hTreeView , $hItem [ $x ], 1 ) 
     For $y = 1 To 3 
       $hChildItem [ $iYItem ] = _GUICtrlTreeView_AddChild ( $hTreeView , $hItem [ $x ], StringFormat ( "[%02d] New Child" , $y ), 0 , 3 ) 
       _GUICtrlTreeView_SetStateImageIndex ( $hTreeView , $hChildItem [ $iYItem ], 1 ) 
       $iYItem += 1 
     Next 
   Next 
   _GUICtrlTreeView_EndUpdate ( $hTreeView ) 
 
   _GUICtrlTreeView_SelectItem ( $hTreeView , $hItem [ 0 ]) 
   _GUICtrlTreeView_SetStateImageIndex ( $hTreeView , $hItem [ 0 ], 2 ) 
 
   $iYRand = Random ( 0 , 268 , 1 ) 
   $iXRand = Random ( 0 , 396 , 1 ) 
   MsgBox ( 4160 , "Information" , StringFormat ( "Hit Test (%d, %d): %s" , $iXRand , $iYRand , _GetHitString ( _GUICtrlTreeView_HitTest ( $hTreeView , $iXRand , $iYRand )))) 
 
   ; 循环至用户退出 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 
 Func _GetHitString( $iResult ) 
   Switch $iResult 
     Case 1 
       Return "In the client area, but below the last item"       ; 客户区中最后项下 
     Case 2 
       Return "On the bitmap associated with an item"       ; 与项目相关的位图上 
     Case 4 
       Return "On the text associated with an item"       ; 与项目相关的文本上 
     Case 8 
       Return "In the indentation associated with an item"       ; 与项目相关的缩进中 
     Case 16 
       Return "On the button associated with an item"       ; 与项目相关的按钮上 
     Case 32 
       Return "In the area to the right of an item"       ; 项目右侧区域 
     Case 64 
       Return "On the state icon for a item that is in a user-defined state" ; 用户定义状态的项目状态图标上 
     Case 128 
       Return "Above the client area"       ; 用户区上 
     Case 256 
       Return "Below the client area"       ; 用户区下 
     Case 512 
       Return "To the left of the client area"       ; 用户区左 
     Case 1024 
       Return "To the right of the client area"       ; 用户区右 
   EndSwitch 
 EndFunc ;==>_GetHitString 
 
 Func _CreateNormalImageList() 
   $hImage = _GUIImageList_Create ( 16 , 16 , 5 , 3 ) 
   _GUIImageList_AddIcon ( $hImage , "shell32.dll" , 110 ) 
   _GUIImageList_AddIcon ( $hImage , "shell32.dll" , 131 ) 
   _GUIImageList_AddIcon ( $hImage , "shell32.dll" , 165 ) 
   _GUIImageList_AddIcon ( $hImage , "shell32.dll" , 168 ) 
   _GUIImageList_AddIcon ( $hImage , "shell32.dll" , 137 ) 
   _GUIImageList_AddIcon ( $hImage , "shell32.dll" , 146 ) 
 EndFunc ;==>_CreateNormalImageList 
 
 Func _CreateStateImageList() 
   $hStateImage = _GUIImageList_Create ( 16 , 16 , 5 , 3 ) 
   _GUIImageList_AddIcon ( $hStateImage , "shell32.dll" , 3 ) 
   _GUIImageList_AddIcon ( $hStateImage , "shell32.dll" , 4 ) 
 EndFunc ;==>_CreateStateImageList 
 
