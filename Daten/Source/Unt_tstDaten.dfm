�
 TFORM1 0�  TPF0TForm1Form1Left� Top� WidthfHeight�Captionmn>>Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPixelsPerInch`
TextHeight TDBGridDBGrid1Left`TopWidth�HeightY
DataSourceDataSource1TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TDBNavigatorDBNavigator1Left`ToppWidth� Height
DataSourceDataSource1TabOrder  TQueryQuery1Active	DatabaseNameMyoneSessionName
Session1_1SQL.Stringsselect * from Kategorietabelle UpdateObject
UpdateSQL1LeftTop  	TDatabase	Database1	AliasNameMyOne97	Connected	DatabaseNameMyoneLoginPromptSessionName
Session1_1LeftTop0  TSessionSession1Active	AutoSessionName	SQLHourGlassLeft(Top0  
TUpdateSQL
UpdateSQL1ModifySQL.Stringsupdate Kategorietabelleset  Zusammenhang = :Zusammenhang,  Bezeichnung = :Bezeichnung,  Anrede = :Anrede,  Tabelle = :Tabelle,  UpKategorie = :UpKategorie,  Info = :Info,  Crc32 = :Crc32where  ID = :OLD_ID InsertSQL.Stringsinsert into KategorietabelleH  (Zusammenhang, Bezeichnung, Anrede, Tabelle, UpKategorie, Info, Crc32)valuesH  (:Zusammenhang, :Bezeichnung, :Anrede, :Tabelle, :UpKategorie, :Info, 
   :Crc32) DeleteSQL.Stringsdelete from Kategorietabellewhere  ID = :OLD_ID Left(Top  TDataSourceDataSource1DataSetQuery1LeftTopX   