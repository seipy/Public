object frmAddPageMain: TfrmAddPageMain
  Left = 582
  Top = 235
  Caption = 'Add Page and Controls Demonstration'
  ClientHeight = 410
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'System'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  object TabbedNotebook1: TPageControl
    Left = 12
    Top = 24
    Width = 614
    Height = 302
    ActivePage = ts1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'Default'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      object CheckBox1: TCheckBox
        Left = 444
        Top = 216
        Width = 119
        Height = 29
        Caption = 'CheckBox1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'System'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object AddPageButton: TButton
    Left = 24
    Top = 348
    Width = 134
    Height = 50
    Caption = 'Add page'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = AddPageButtonClick
  end
  object CloseBitBtn: TBitBtn
    Left = 480
    Top = 348
    Width = 134
    Height = 50
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    Kind = bkClose
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
  end
  object AddControlButton: TButton
    Left = 180
    Top = 348
    Width = 134
    Height = 50
    Caption = 'Add control'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = AddControlButtonClick
  end
end
