object frmCalc64Main: TfrmCalc64Main
  Left = 198
  Top = 100
  ActiveControl = BitBtn1
  Caption = 'Calculator 64'
  ClientHeight = 599
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'System'
  Font.Style = []
  KeyPreview = True
  Menu = CalcMainMenu
  OldCreateOrder = True
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object btn7: TSpeedButton
    Tag = 7
    Left = 345
    Top = 408
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btn8: TSpeedButton
    Tag = 8
    Left = 405
    Top = 408
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btn9: TSpeedButton
    Tag = 9
    Left = 465
    Top = 408
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btn4: TSpeedButton
    Tag = 4
    Left = 345
    Top = 456
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btn5: TSpeedButton
    Tag = 5
    Left = 405
    Top = 456
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btn6: TSpeedButton
    Tag = 6
    Left = 465
    Top = 456
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btn1: TSpeedButton
    Tag = 1
    Left = 345
    Top = 504
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btn2: TSpeedButton
    Tag = 2
    Left = 405
    Top = 504
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btn3: TSpeedButton
    Tag = 3
    Left = 465
    Top = 504
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btn0: TSpeedButton
    Left = 345
    Top = 552
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btnNegate: TSpeedButton
    Left = 405
    Top = 552
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '+/-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = btnNegateClick
  end
  object btnA: TSpeedButton
    Tag = 10
    Left = 345
    Top = 360
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = 'A'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btnB: TSpeedButton
    Tag = 11
    Left = 405
    Top = 360
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = 'B'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btnC: TSpeedButton
    Tag = 12
    Left = 465
    Top = 360
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = 'C'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btnD: TSpeedButton
    Tag = 13
    Left = 345
    Top = 312
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = 'D'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btnE: TSpeedButton
    Tag = 14
    Left = 405
    Top = 312
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = 'E'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btnF: TSpeedButton
    Tag = 15
    Left = 465
    Top = 312
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = 'F'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = ButtonDigitClick
  end
  object btnDivide: TSpeedButton
    Tag = -2
    Left = 285
    Top = 360
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = OpButtonClick
  end
  object btnMultiply: TSpeedButton
    Tag = -1
    Left = 285
    Top = 312
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = OpButtonClick
  end
  object btnMinus: TSpeedButton
    Tag = -4
    Left = 285
    Top = 456
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = OpButtonClick
  end
  object btnPlus: TSpeedButton
    Tag = -3
    Left = 285
    Top = 408
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = OpButtonClick
  end
  object btnAnd: TSpeedButton
    Tag = -5
    Left = 525
    Top = 312
    Width = 98
    Height = 64
    AllowAllUp = True
    Caption = 'AND'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = OpButtonClick
  end
  object btnOr: TSpeedButton
    Tag = -6
    Left = 525
    Top = 386
    Width = 98
    Height = 64
    AllowAllUp = True
    Caption = 'OR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = OpButtonClick
  end
  object btnXor: TSpeedButton
    Tag = -7
    Left = 525
    Top = 459
    Width = 98
    Height = 64
    AllowAllUp = True
    Caption = 'XOR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = OpButtonClick
  end
  object btnNot: TSpeedButton
    Left = 525
    Top = 532
    Width = 98
    Height = 64
    AllowAllUp = True
    Caption = 'NOT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = btnNotClick
  end
  object LineBevel: TBevel
    Left = 12
    Top = 288
    Width = 610
    Height = 14
    Shape = bsBottomLine
  end
  object btnClear: TSpeedButton
    Left = 170
    Top = 312
    Width = 104
    Height = 45
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = btnClearClick
  end
  object btnClearEntry: TSpeedButton
    Left = 170
    Top = 360
    Width = 104
    Height = 45
    Caption = '&CE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = btnClearEntryClick
  end
  object btnBack: TSpeedButton
    Left = 12
    Top = 312
    Width = 110
    Height = 45
    Caption = 'Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = btnBackClick
  end
  object btnPoint: TSpeedButton
    Tag = -4
    Left = 465
    Top = 552
    Width = 52
    Height = 45
    AllowAllUp = True
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    OnClick = OpButtonClick
  end
  object pnlDisplay: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 248
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object MemButton: TSpeedButton
      Left = 12
      Top = 12
      Width = 38
      Height = 38
      Caption = 'M'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
    end
    object DecButton: TSpeedButton
      Left = 12
      Top = 60
      Width = 38
      Height = 38
      GroupIndex = 1
      Caption = '&D'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      OnClick = DecHexBinButtonClick
    end
    object HexButton: TSpeedButton
      Left = 12
      Top = 108
      Width = 38
      Height = 38
      GroupIndex = 1
      Caption = '&H'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      OnClick = DecHexBinButtonClick
    end
    object BinButton: TSpeedButton
      Left = 12
      Top = 156
      Width = 38
      Height = 38
      GroupIndex = 1
      Caption = '&B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      OnClick = DecHexBinButtonClick
    end
    object BinBevel: TPanel
      Left = 60
      Top = 156
      Width = 640
      Height = 65
      BevelOuter = bvLowered
      Color = 16777162
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lblBinary: TLabel
        Left = 1
        Top = 1
        Width = 638
        Height = 63
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1000 0000 0000 0000 0000 0000 0000 0000 0000'
        Color = 16777162
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -26
        Font.Name = 'Lucida Console'
        Font.Pitch = fpFixed
        Font.Style = [fsItalic]
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 4
        ExplicitTop = 8
        ExplicitWidth = 629
        ExplicitHeight = 53
      end
    end
    object HexBevel: TPanel
      Left = 60
      Top = 108
      Width = 640
      Height = 40
      BevelOuter = bvLowered
      Color = 16777162
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lblHex: TLabel
        Left = 1
        Top = 1
        Width = 638
        Height = 38
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = '7FFF FFFF '
        Color = 16777162
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Lucida Console'
        Font.Pitch = fpFixed
        Font.Style = [fsItalic]
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
        ExplicitLeft = 4
        ExplicitTop = 8
        ExplicitWidth = 632
        ExplicitHeight = 28
      end
    end
    object DecBevel: TPanel
      Left = 60
      Top = 60
      Width = 640
      Height = 40
      BevelOuter = bvLowered
      Color = 16777162
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object lblDecimal: TLabel
        Left = 1
        Top = 1
        Width = 638
        Height = 38
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = '-2.147.483.648 '
        Color = 16777162
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Lucida Console'
        Font.Pitch = fpFixed
        Font.Style = [fsItalic]
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
        ExplicitLeft = 4
        ExplicitTop = 8
        ExplicitWidth = 632
        ExplicitHeight = 28
      end
    end
    object MemBevel: TPanel
      Left = 60
      Top = 12
      Width = 640
      Height = 40
      BevelOuter = bvLowered
      Color = 16777162
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object lblMemory: TLabel
        Left = 1
        Top = 1
        Width = 638
        Height = 38
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0 '
        Color = 16777162
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = 'Lucida Console'
        Font.Pitch = fpFixed
        Font.Style = [fsItalic]
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
        ExplicitLeft = 4
        ExplicitTop = 8
        ExplicitWidth = 632
        ExplicitHeight = 28
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 12
    Top = 524
    Width = 160
    Height = 74
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    Kind = bkClose
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 0
  end
  object btnEquals: TButton
    Left = 285
    Top = 504
    Width = 52
    Height = 93
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnEqualsClick
  end
  object CalcMainMenu: TMainMenu
    Left = 41
    Top = 362
    object CalcMenuItem: TMenuItem
      Caption = 'C&alc'
      object CalcExitMenuItem: TMenuItem
        Caption = 'E&xit'
        ShortCut = 32856
        OnClick = CalcExitMenuItemClick
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      object Copy1: TMenuItem
        Caption = '&Copy'
        ShortCut = 16451
        OnClick = Copy1Click
      end
      object Paste1: TMenuItem
        Caption = '&Paste'
        ShortCut = 16470
        OnClick = Paste1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'He&lp'
      object About1: TMenuItem
        Caption = '&About...'
        OnClick = About1Click
      end
    end
  end
  object ActionList1: TActionList
    Left = 98
    Top = 362
  end
end
