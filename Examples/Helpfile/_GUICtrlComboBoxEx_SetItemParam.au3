 #include <GuiComboBoxEx.au3> 
 #include <GuiConstantsEx.au3> 
 #include <GuiImageList.au3> 
 
 Opt ( ' MustDeclareVars ' , 1 ) 
 
 $Debug_CB = False ; 检查传递给函数的类名 , 设置为真并使用另一控件的句柄观察其工作 
 
 _Main() 
 
 Func _Main() 
   Local $hGUI , $hImage , $hCombo 
 
   ; 创建界面 
   $hGUI = GUICreate ( " ComboBoxEx Item Param ", 400 , 300 ) 
   $hCombo = _GUICtrlComboBoxEx_Create ( $hGUI , "", 2 , 2 , 394 , 100 ) 
   GUISetState () 
 
   $hImage = _GUIImageList_Create ( 16 , 16 , 5 , 3 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 110 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 131 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 165 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 168 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 137 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 146 ) 
   _GUIImageList_Add ( $hImage , _GUICtrlComboBoxEx_CreateSolidBitMap ( $hCombo , 0xFF0000 , 16 , 16 )) 
   _GUIImageList_Add ( $hImage , _GUICtrlComboBoxEx_CreateSolidBitMap ( $hCombo , 0x00FF00 , 16 , 16 )) 
   _GUIImageList_Add ( $hImage , _GUICtrlComboBoxEx_CreateSolidBitMap ( $hCombo , 0x0000FF , 16 , 16 )) 
   _GUICtrlComboBoxEx_SetImageList ( $hCombo , $hImage ) 
 
   _GUICtrlComboBoxEx_BeginUpdate ( $hCombo ) 
   ; 添加字符串 
   For $x = 0  To 8 
     $image = Random ( 0 , 8 , 1 ) 
     _GUICtrlComboBoxEx_AddString ( $hCombo , StringFormat ( " %03d : Random string ", Random ( 1 , 100 , 1 )) , $image , $image ) 
   Next 
   _GUICtrlComboBoxEx_EndUpdate ( $hCombo ) 
   _GUICtrlComboBoxEx_SetItemImage ( $hCombo , 0 , 1 ) 
   _GUICtrlComboBoxEx_SetItemIndent ( $hCombo , 1 , 1 ) 
   _GUICtrlComboBoxEx_SetItemIndent ( $hCombo , 2 , 1 ) 
   _GUICtrlComboBoxEx_SetItemParam ( $hCombo , 2 , 54321 ) 
   MsgBox ( 4160 , " Information ", " Item Param:  " & _GUICtrlComboBoxEx_GetItemParam ( $hCombo , 2 )) 
 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc ;==>_Main 
 
