inherited ViewLog: TViewLog
  Caption = 'Log de grava'#231#245'es do banco de dados'
  ClientHeight = 474
  ClientWidth = 704
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 720
  ExplicitHeight = 513
  TextHeight = 15
  object pnlCentral: TPanel
    Left = 0
    Top = 0
    Width = 591
    Height = 474
    Align = alClient
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    StyleElements = []
    object memLog: TMemo
      Left = 1
      Top = 1
      Width = 589
      Height = 472
      Align = alClient
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object pnlBotoes: TPanel
    Left = 591
    Top = 0
    Width = 113
    Height = 474
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alRight
    Color = 8404992
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    StyleElements = []
    object Label1: TLabel
      Left = 6
      Top = 16
      Width = 99
      Height = 74
      AutoSize = False
      Caption = 'Desligar rolagem autom'#225'tica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object btnFechar: TButton
      AlignWithMargins = True
      Left = 6
      Top = 378
      Width = 101
      Height = 90
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object swtScrollMemo: TToggleSwitch
      Left = 16
      Top = 96
      Height = 23
      Color = clGray
      DisabledColor = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      FrameColor = clWhite
      ParentFont = False
      State = tssOn
      TabOrder = 1
      ThumbColor = clNavy
    end
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 432
    Top = 88
  end
end
