object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Caption = 'CRM Atak'
  ClientHeight = 407
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnlView: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 407
    Align = alClient
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 8
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Usurios1: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = Usurios1Click
      end
      object ipodePessoas1: TMenuItem
        Caption = 'Tipos de Pessoa'
        OnClick = ipodePessoas1Click
      end
      object Pessoa1: TMenuItem
        Caption = 'Pessoa'
        OnClick = Pessoa1Click
      end
    end
    object Utilirios1: TMenuItem
      Caption = 'Utili'#225'rios'
      object Log1: TMenuItem
        Caption = 'Log'
        OnClick = Log1Click
      end
    end
  end
end
