
#include  <GuiToolbar.au3> 
#include  <GuiConstantsEx.au3> 
#include  <WindowsConstants.au3> 
#include  <Constants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_TB  =  False  ; 检查传递给函数的类名, 设置为真并使用另一控件的句柄观察其工作 
Global  $iMemo 

_Main () 

Func _Main () 
    Local  $hGUI ,  $hToolbar ,  $aStrings [ 4 ] 
    Local  Enum  $idNew  =  1000 ,  $idOpen ,  $idSave ,  $idHelp 

    ; 创建界面 
    $hGUI  =  GUICreate ( "Toolbar" ,  400 ,  300 ) 
    $hToolbar  =  _GUICtrlToolbar_Create ( $hGUI ) 
    $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  36 ,  396 ,  262 ,  $WS_VSCROLL ) 
  
  GUICtrlSetFont ( $iMemo ,  10 ,  400 ,  0 ,  "Courier New" ) 
  
  GUISetState () 

    ; 
添加标准系统位图 
    Switch  _GUICtrlToolbar_GetBitmapFlags ( $hToolbar ) 
    
    Case  0 
            _GUICtrlToolbar_AddBitmap ( $hToolbar ,  1 ,  - 1 ,  $IDB_STD_SMALL_COLOR ) 
        Case  2 
      
      _GUICtrlToolbar_AddBitmap ( $hToolbar ,  1 ,  - 1 ,  $IDB_STD_LARGE_COLOR ) 
    EndSwitch 

    ; 添加字符串 
    $aStrings [ 0 ]  =  _GUICtrlToolbar_AddString ( $hToolbar ,  "&New Button" ) 
    $aStrings [ 1 ]  =  _GUICtrlToolbar_AddString ( $hToolbar ,  "&Open Button" ) 
    $aStrings [ 2 ]  =  _GUICtrlToolbar_AddString ( $hToolbar ,  "&Save Button" ) 
    $aStrings [ 3 ]  =  _GUICtrlToolbar_AddString ( $hToolbar ,  "&Help Button" ) 

    ; 
Add buttons 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idNew ,  $STD_FILENEW ,  $aStrings [ 0 ]) 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idOpen ,  $STD_FILEOPEN ,  $aStrings [ 1 ]) 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idSave ,  $STD_FILESAVE ,  $aStrings [ 2 ]) 
    _GUICtrlToolbar_AddButtonSep ( $hToolbar ) 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idHelp ,  $STD_HELP ,  $aStrings [ 3 ]) 

    ; 标记保存按钮 
    
MemoWrite ( "Save button Highlight 
State: "  &  _GUICtrlToolbar_IsButtonHighlighted ( $hToolbar ,  $idSave )) 
    _GUICtrlToolbar_HighlightButton ( $hToolbar ,  $idSave ) 
    
MemoWrite ( "Save button Highlight 
State: "  &  _GUICtrlToolbar_IsButtonHighlighted ( $hToolbar ,  $idSave )) 

    ; 
循环至用户退出 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 

EndFunc    ;==>_Main 

; 向memo控件写入信息 
Func MemoWrite ( $sMessage  =  "" ) 
    GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
EndFunc    ;==>MemoWrite 

