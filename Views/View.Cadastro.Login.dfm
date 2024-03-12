inherited ViewCadastroLogin: TViewCadastroLogin
  Caption = 'Cadastro de Usuarios'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlCentral: TPanel
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 65
      Height = 25
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 95
      Width = 52
      Height = 25
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object dbeLogin: TDBEdit
      Left = 16
      Top = 47
      Width = 449
      Height = 33
      DataField = 'login'
      DataSource = dscMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbeSenha: TDBEdit
      Left = 16
      Top = 126
      Width = 449
      Height = 33
      DataField = 'senha'
      DataSource = dscMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '#'
      TabOrder = 1
    end
    object dbeAdministrador: TDBCheckBox
      Left = 16
      Top = 185
      Width = 185
      Height = 24
      Caption = 'Administrador'
      DataField = 'administrador'
      DataSource = dscMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      WordWrap = True
    end
  end
end
