object ViewLogin: TViewLogin
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Informe o Usu'#225'rio e Senha:'
  ClientHeight = 185
  ClientWidth = 457
  Color = clBtnFace
  Constraints.MaxHeight = 223
  Constraints.MaxWidth = 469
  Constraints.MinHeight = 223
  Constraints.MinWidth = 469
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 344
    Top = 0
    Width = 113
    Height = 185
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
    ExplicitLeft = 340
    ExplicitHeight = 184
    object Button1: TButton
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 101
      Height = 80
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Logar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 6
      Top = 99
      Width = 101
      Height = 80
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
      ExplicitTop = 98
    end
  end
  object pnlCentro: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 185
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Color = 16777209
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    StyleElements = []
    ExplicitWidth = 340
    ExplicitHeight = 184
    object edtUsuario: TEdit
      Left = 16
      Top = 32
      Width = 305
      Height = 33
      CharCase = ecLowerCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Digite seu usu'#225'rio'
    end
    object edtSenha: TEdit
      Left = 16
      Top = 96
      Width = 305
      Height = 33
      CharCase = ecLowerCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '#'
      TabOrder = 1
      TextHint = 'Digite sua senha'
    end
  end
end
