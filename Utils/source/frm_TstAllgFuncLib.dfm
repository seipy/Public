object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 464
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 496
    Top = 71
    Width = 83
    Height = 58
    Caption = 'AoB'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 457
    Height = 129
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 463
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Zufall->AoB'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 544
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Text->AoB'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 464
    Top = 40
    Width = 150
    Height = 21
    TabOrder = 3
    Text = 
      'Dies ist ein Text der in ein Array Of Byte-Feld umgewandelt wird' +
      '.'
  end
  object Memo2: TMemo
    Left = 0
    Top = 136
    Width = 457
    Height = 209
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object Button3: TButton
    Left = 464
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Show Crc64 t.'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 544
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Show crc32 t.'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 463
    Top = 167
    Width = 75
    Height = 25
    Caption = 'Crc64(AoB)'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 544
    Top = 167
    Width = 75
    Height = 25
    Caption = 'crc32(AoB)'
    TabOrder = 8
    OnClick = Button6Click
  end
  object Edit2: TEdit
    Left = 464
    Top = 200
    Width = 155
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
    Text = 'Edit2'
  end
  object Button7: TButton
    Left = 463
    Top = 227
    Width = 156
    Height = 25
    Caption = 'Crc64(AoB) 2 Teile'
    TabOrder = 10
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 464
    Top = 256
    Width = 155
    Height = 25
    Caption = 'Sort1'
    TabOrder = 11
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 464
    Top = 288
    Width = 155
    Height = 25
    Caption = 'Delay 1000'
    TabOrder = 12
    OnClick = Button9Click
  end
end
