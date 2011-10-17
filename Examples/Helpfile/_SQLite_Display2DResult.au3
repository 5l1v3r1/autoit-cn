 
 #include <SQLite.au3> 
 #include <SQLite.dll.au3> 
 
 Local $aResult , $iRows , $iColumns , $iRval 
 
 _SQLite_Startup () 
 If @error Then 
   MsgBox ( 16 , "SQLite Error" , "SQLite.dll Can't be Loaded!" ) 
   Exit -1 
 EndIf 
 _SQLite_Open () ;  打开:内存:数据库 
 If @error Then 
   MsgBox ( 16 , "SQLite Error" , "Can't Load Database!" ) 
   Exit -1 
 EndIf 
 
 ; 示例表 
 ;   Name      | Age 
 ;   ----------------------- 
 ;   Alice     | 43 
 ;   Bob      | 28 
 ;   Cindy     | 21 
 
 If Not _SQLite_Exec (- 1 , "CREATE TEMP table persons (Name, Age);" ) = $SQLITE_OK Then _ 
   MsgBox ( 16 , "SQLite " & _SQLite_LibVersion () & " Error" , _SQLite_ErrMsg ()) 
 If Not _SQLite_Exec (- 1 , "INSERT INTO persons VALUES ('Alice','43');" ) = $SQLITE_OK Then _ 
   MsgBox ( 16 , "SQLite " & _SQLite_LibVersion () & " Error" , _SQLite_ErrMsg ()) 
 If Not _SQLite_Exec (- 1 , "INSERT INTO persons VALUES ('Bob','28');" ) = $SQLITE_OK Then _ 
   MsgBox ( 16 , "SQLite " & _SQLite_LibVersion () & " Error" , _SQLite_ErrMsg ()) 
 If Not _SQLite_Exec (- 1 , "INSERT INTO persons VALUES ('Cindy','21');" ) = $SQLITE_OK Then _ 
   MsgBox ( 16 , "SQLite " & _SQLite_LibVersion () & " Error" , _SQLite_ErrMsg ()) 
 
 ; 查询 
 $iRval = _SQLite_Gettable2d (- 1 , "SELECT * FROM persons;" , $aResult , $iRows , $iColumns ) 
 If $iRval = $SQLITE_OK Then 
   _SQLite_Display2DResult ( $aResult ) 
   _ArrayDisplay ( $aResult , "SQLite" & _SQLite_LibVersion () & " - Query Result ") 
 
 ;~    $aResult如下: 
 ;~   
 ;~   Name   Age 
 ;~   Alice  43 
 ;~   Bob    28 
 ;~   Cindy  21 
 ;~ 
   $iRval = _SQLite_Gettable2d (- 1 , "SELECT * FROM persons;" , $aResult , $iRows , $iColumns , '', True ) 
   _SQLite_Display2DResult ( $aResult ) 
   _ArrayDisplay ( $aResult , "SQLite" & _SQLite_LibVersion () & " - Query Result ") 
 
 ;~    使用_SQLite_GetTable2d切换维度则格式如下:: 
 ;~   
 ;~   Name  Alice  Bob  Cindy 
 ;~   Age   43    28   21 
 
 Else 
   MsgBox ( 16 , "SQLite Error: " & $iRval , _SQLite_ErrMsg ()) 
 EndIf 
 
 _SQLite_Close () 
 _SQLite_Shutdown () 
 
