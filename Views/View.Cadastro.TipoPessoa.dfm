inherited ViewCadastroTipoPessoa: TViewCadastroTipoPessoa
  Caption = 'Cadastro de Tipos de Pessoa'
  TextHeight = 15
  inherited pnlCentral: TPanel
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 18
      Height = 25
      Caption = 'ID'
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
      Width = 82
      Height = 25
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object dbeId: TDBEdit
      Left = 16
      Top = 47
      Width = 121
      Height = 33
      DataField = 'ID'
      DataSource = dscMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbeDescricao: TDBEdit
      Left = 16
      Top = 126
      Width = 449
      Height = 33
      DataField = 'descricao'
      DataSource = dscMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
