object DMPrincipal: TDMPrincipal
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object SQLConnection: TSQLConnection
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver290.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver290.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=C:\Teste Atak\Win32\Debug\TESTE_ATAK.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Connected = True
    Left = 40
    Top = 16
  end
  object qryGenerica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 40
    Top = 88
  end
  object qryUsuario: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select'
      '  *'
      'from usuario')
    SQLConnection = SQLConnection
    Left = 200
    Top = 24
  end
  object dspUsuario: TDataSetProvider
    DataSet = qryUsuario
    Left = 288
    Top = 24
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    BeforePost = DataSetLogBeforePost
    BeforeDelete = DataSetLogBeforeDelete
    Left = 376
    Top = 24
    object cdsUsuarioLOGIN: TStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsUsuarioSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Size = 50
    end
    object cdsUsuarioADMINISTRADOR: TStringField
      DisplayLabel = 'Admin'
      FieldName = 'ADMINISTRADOR'
      FixedChar = True
      Size = 1
    end
  end
  object qryTipoPessoa: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * from TIPO_PESSOA')
    SQLConnection = SQLConnection
    Left = 200
    Top = 88
  end
  object dspTipoPessoa: TDataSetProvider
    DataSet = qryTipoPessoa
    Left = 288
    Top = 88
  end
  object cdsTipoPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoPessoa'
    BeforePost = DataSetLogBeforePost
    BeforeDelete = DataSetLogBeforeDelete
    Left = 376
    Top = 88
    object cdsTipoPessoaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTipoPessoaDESCRICAO: TStringField
      DisplayLabel = 'Derscri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object qryPessoa: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * from PESSOA')
    SQLConnection = SQLConnection
    Left = 200
    Top = 152
  end
  object dspPessoa: TDataSetProvider
    DataSet = qryPessoa
    Left = 288
    Top = 152
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoa'
    BeforePost = DataSetLogBeforePost
    BeforeDelete = DataSetLogBeforeDelete
    Left = 376
    Top = 152
    object cdsPessoaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPessoaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 50
    end
    object cdsPessoaCPF: TStringField
      FieldName = 'CPF'
      EditMask = '999 999 999\-99;0;_'
    end
    object cdsPessoaID_TIPO_PESSOA: TIntegerField
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'ID_TIPO_PESSOA'
    end
    object cdsPessoaRG: TStringField
      FieldName = 'RG'
      EditMask = '000.000.000-0;1;_'
    end
    object cdsPessoaSTATUS: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dspEndereco: TDataSetProvider
    DataSet = qryEndereco
    Left = 288
    Top = 216
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PESSOA'
    MasterFields = 'ID'
    MasterSource = dataSourcePessoa
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspEndereco'
    BeforePost = DataSetLogBeforePost
    BeforeDelete = DataSetLogBeforeDelete
    Left = 376
    Top = 216
    object cdsEnderecoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEnderecoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Visible = False
    end
    object cdsEnderecoENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 30
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsEnderecoNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      DisplayWidth = 5
      FieldName = 'NUMERO'
    end
    object cdsEnderecoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 30
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsEnderecoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 30
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsEnderecoESTADO: TStringField
      DisplayLabel = 'UF'
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsEnderecoCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 30
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
  end
  object dataSourcePessoa: TDataSource
    AutoEdit = False
    DataSet = cdsPessoa
    Left = 464
    Top = 152
  end
  object qryEndereco: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PESSOA'
        ParamType = ptInput
        Value = 1
      end>
    SQL.Strings = (
      'select * from ENDERECO'
      'where id_pessoa = :id_pessoa')
    SQLConnection = SQLConnection
    Left = 200
    Top = 216
  end
end
