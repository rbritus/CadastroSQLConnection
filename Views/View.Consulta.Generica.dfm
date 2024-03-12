inherited ViewConsultaGenerica: TViewConsultaGenerica
  Caption = 'ViewConsultaGenerica'
  ClientHeight = 461
  ClientWidth = 750
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 762
  ExplicitHeight = 499
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 413
    Align = alClient
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 86
    ExplicitWidth = 746
    ExplicitHeight = 326
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 748
      Height = 411
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 413
    Width = 750
    Height = 48
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Color = 8404992
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    StyleElements = []
    ExplicitTop = 412
    ExplicitWidth = 746
    object btnSelecionar: TButton
      Left = 307
      Top = 8
      Width = 137
      Height = 33
      Caption = 'Selecionar'
      TabOrder = 0
      OnClick = btnSelecionarClick
    end
  end
  object DataSource1: TDataSource
    Left = 288
    Top = 222
  end
end
