inherited ViewCadastroPessoa: TViewCadastroPessoa
  Caption = 'Cadastro de Pessoas'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlBotoes: TPanel
    ExplicitLeft = 495
    ExplicitHeight = 502
    inherited btnFechar: TButton
      ExplicitTop = 406
    end
  end
  inherited pnlCentral: TPanel
    ExplicitWidth = 495
    ExplicitHeight = 502
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
      Top = 87
      Width = 51
      Height = 25
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 159
      Width = 32
      Height = 25
      Caption = 'CPF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 272
      Top = 159
      Width = 24
      Height = 25
      Caption = 'RG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 235
      Width = 99
      Height = 25
      Caption = 'Tipo Pessoa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 318
      Width = 79
      Height = 25
      Caption = 'Endere'#231'o'
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
    object dbeNome: TDBEdit
      Left = 16
      Top = 118
      Width = 449
      Height = 33
      DataField = 'nome'
      DataSource = dscMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dbeCPF: TDBEdit
      Left = 16
      Top = 190
      Width = 193
      Height = 33
      DataField = 'cpf'
      DataSource = dscMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbeRG: TDBEdit
      Left = 272
      Top = 190
      Width = 193
      Height = 33
      DataField = 'rg'
      DataSource = dscMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 16
      Top = 266
      Width = 193
      Height = 33
      DataField = 'id_tipo_pessoa'
      DataSource = dscMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      KeyField = 'id'
      ListField = 'descricao'
      ListSource = dscTipoPessoa
      ParentFont = False
      TabOrder = 4
    end
    object dbeStatus: TDBCheckBox
      Left = 272
      Top = 266
      Width = 185
      Height = 24
      Caption = 'Ativo'
      DataField = 'status'
      DataSource = dscMain
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      ValueChecked = 'A'
      ValueUnchecked = 'I'
      WordWrap = True
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 349
      Width = 449
      Height = 113
      DataSource = dscEndereco
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBNavigator1: TDBNavigator
      Left = 16
      Top = 468
      Width = 440
      Height = 25
      DataSource = dscEndereco
      TabOrder = 7
    end
  end
  object dscTipoPessoa: TDataSource
    Left = 448
    Top = 72
  end
  object dscEndereco: TDataSource
    OnStateChange = dscEnderecoStateChange
    Left = 448
    Top = 136
  end
end
