
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiConstantsEx.au3> 
#include  <GuiSlider.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_S  =  False  ; 检查传递给函数的类名, 
设置为真并使用另一控件的句柄观察其工作 

_Main () 

Func _Main () 
    Local  $hSlider 

    ; 创建界面 
    GUICreate ( "Slider Get 
Unicode Format" ,  400 ,  296 ) 
    $hSlider  =  GUICtrlCreateSlider ( 2 ,  2 ,  396 ,  20 ,  BitOR ( $TBS_TOOLTIPS ,  $TBS_AUTOTICKS ,  $TBS_ENABLESELRANGE )) 
    GUISetState () 

  
  ; 获取Unicode格式 
    MsgBox ( 4160 ,  "Information" ,  "Unicode Format: "  &  _GUICtrlSlider_GetUnicodeFormat ( $hSlider )) 

  
  ; 设置Unicode格式 
    MsgBox ( 4160 ,  "Information" ,  "Previous Unicode Format: "  &  _GUICtrlSlider_SetUnicodeFormat ( $hSlider ,  False )) 

  
  ; 获取Unicode格式 
    MsgBox ( 4160 ,  "Information" ,  "Unicode Format: "  &  _GUICtrlSlider_GetUnicodeFormat ( $hSlider )) 

  
  ; 循环至用户退出 
    Do 
  
  Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 

