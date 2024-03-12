unit DM.Principal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.DbxSqlite,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, DBXCommon, Data.SqlExpr,
  Data.DBXMySQL, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.MySQL, FireDAC.Comp.Client, Data.DBXInterBase,
  Data.DBXFirebird, MidasLib, Attribute.Tabela;

type
  TAcaoLog = (alInsert, alEdit, alDelete);

  TDMPrincipal = class(TDataModule)
    SQLConnection: TSQLConnection;
    qryGenerica: TSQLQuery;
    qryUsuario: TSQLQuery;
    dspUsuario: TDataSetProvider;
    [Tabela('USUARIO')]
    cdsUsuario: TClientDataSet;
    qryTipoPessoa: TSQLQuery;
    dspTipoPessoa: TDataSetProvider;
    [Tabela('TIPO_PESSOA')]
    cdsTipoPessoa: TClientDataSet;
    qryPessoa: TSQLQuery;
    dspPessoa: TDataSetProvider;
    [Tabela('PESSOA')]
    cdsPessoa: TClientDataSet;
    dspEndereco: TDataSetProvider;
    [Tabela('ENDERECO')]
    cdsEndereco: TClientDataSet;
    dataSourcePessoa: TDataSource;
    cdsUsuarioLOGIN: TStringField;
    cdsUsuarioSENHA: TStringField;
    cdsUsuarioADMINISTRADOR: TStringField;
    cdsTipoPessoaID: TIntegerField;
    cdsTipoPessoaDESCRICAO: TStringField;
    cdsPessoaID: TIntegerField;
    cdsPessoaNOME: TStringField;
    cdsPessoaCPF: TStringField;
    cdsPessoaID_TIPO_PESSOA: TIntegerField;
    cdsPessoaRG: TStringField;
    cdsPessoaSTATUS: TStringField;
    cdsEnderecoID: TIntegerField;
    cdsEnderecoID_PESSOA: TIntegerField;
    cdsEnderecoENDERECO: TStringField;
    cdsEnderecoNUMERO: TIntegerField;
    cdsEnderecoBAIRRO: TStringField;
    cdsEnderecoCIDADE: TStringField;
    cdsEnderecoESTADO: TStringField;
    cdsEnderecoCOMPLEMENTO: TStringField;
    qryEndereco: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataSetLogBeforePost(DataSet: TDataSet);
    procedure DataSetLogBeforeDelete(DataSet: TDataSet);
  private
    FTrans: TDBXTransaction;
    procedure GravarLog(AAcao: TAcaoLog; ADataSet: TDataSet);
    function RetornaAlteracoesParaLog(AAcao: TAcaoLog; ADataSet: TDataSet): string;
    function DadosLogEdicao(ADataSet: TDataSet): string;
    function DadosLogExclusao(ADataSet: TDataSet): string;
    function DadosLogInsercao(ADataSet: TDataSet): string;
    function GetValue(AField: TField): string;
    function GetOldValue(AField: TField): string;
  public
    procedure IniciarTransacao;
    procedure Commit;
    procedure Rollback;
    function GetProximoID(ATabela: string): Integer;
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

uses
  Control.Logs, Helper.Strings, Utils.Rtti, System.Variants;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMPrincipal.IniciarTransacao;
begin
  FTrans := sqlConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
end;

procedure TDMPrincipal.DataSetLogBeforePost(DataSet: TDataSet);
begin
  case dataset.State of
    dsInsert: GravarLog(alInsert,DataSet);
    dsEdit: GravarLog(alEdit,DataSet);
  end;
end;

procedure TDMPrincipal.DataSetLogBeforeDelete(DataSet: TDataSet);
begin
  GravarLog(alDelete,DataSet);
end;

function TDMPrincipal.GetValue(AField: TField): string;
begin
  Result := VarToStrDef(AField.Value, EmptyStr);
end;

function TDMPrincipal.GetOldValue(AField: TField): string;
begin
  Result := VarToStrDef(AField.OldValue, EmptyStr);
end;

function TDMPrincipal.DadosLogInsercao(ADataSet: TDataSet): string;
begin
  Result.clear;
  Result.add('Inserção de dados na tabela: ' + TUtilsRtti.ObterTabela(ADataSet));
  for var Index := 0 to Pred(ADataSet.FieldCount) do
    Result.append('Coluna ' + ADataSet.Fields[Index].FieldName + ' = ' +
                              GetValue(ADataSet.Fields[Index]));
end;

function TDMPrincipal.DadosLogEdicao(ADataSet: TDataSet): string;
begin
  Result.clear;
  Result.add('Edição de dados na tabela: ' + TUtilsRtti.ObterTabela(ADataSet));
  for var Index := 0 to Pred(ADataSet.FieldCount) do
  if GetValue(ADataSet.Fields[Index]) <> GetOldValue(ADataSet.Fields[Index]) then
    Result.append('Coluna ' + ADataSet.Fields[Index].FieldName + ' mudou de ' +
                              GetValue(ADataSet.Fields[Index]) + ' para ' +
                              GetOldValue(ADataSet.Fields[Index]));
end;

function TDMPrincipal.DadosLogExclusao(ADataSet: TDataSet): string;
begin
  Result.clear;
  Result.add('Exclusão de dados na tabela: ' + TUtilsRtti.ObterTabela(ADataSet));
  for var Index := 0 to ADataSet.FieldCount do
    if pfInKey in ADataSet.Fields[Index].ProviderFlags then
    begin
      Result.append('Registro Excluído ' + ADataSet.Fields[Index].FieldName + ' = ' +
                                           GetValue(ADataSet.Fields[Index]));
      Break;
    end;
end;

function TDMPrincipal.RetornaAlteracoesParaLog(AAcao: TAcaoLog; ADataSet: TDataSet): string;
begin
  case AAcao of
    alInsert: Result := DadosLogInsercao(ADataSet);
    alEdit: Result := DadosLogEdicao(ADataSet);
    alDelete: Result := DadosLogExclusao(ADataSet);
  end;
end;

procedure TDMPrincipal.GravarLog(AAcao: TAcaoLog; ADataSet: TDataSet);
begin
  var LMensagem := RetornaAlteracoesParaLog(AAcao, ADataSet);
  TControlLog.New
    .GravarLog(LMensagem);
end;

procedure TDMPrincipal.Commit;
begin
  sqlConnection.CommitFreeAndNil(FTrans);
  IniciarTransacao;
end;

procedure TDMPrincipal.Rollback;
begin
  sqlConnection.RollbackFreeAndNil(FTrans);
  IniciarTransacao;
end;

procedure TDMPrincipal.DataModuleCreate(Sender: TObject);
const NOME_BANCO = 'TESTE_ATAK.FDB';
begin
  try
    var LDiretorio := IncludeTrailingPathDelimiter((System.SysUtils.GetCurrentDir));
    SQLConnection.LoginPrompt := false;
    SQLConnection.DriverName := 'Firebird';
    SQLConnection.Params.Values['UserName'] := 'SYSDBA';
    SqlConnection.Params.Values['Password'] := 'masterkey';
    SQLConnection.Params.Values['Database'] := LDiretorio + NOME_BANCO;
    SQLConnection.Connected := true;
  except on e:exception do
      raise Exception.Create('Erro de conexão com o banco de dados: ' + e.Message);
  end;
end;

function TDMPrincipal.GetProximoID(ATabela: string): Integer;
const
  SELECT_NEXT = 'SELECT COALESCE(MAX(ID), 0) + 1 AS "MAX" FROM %s';
begin
  DMPrincipal.qryGenerica.Active := False;
  DMPrincipal.qryGenerica.SQL.Clear;
  DMPrincipal.qryGenerica.SQL.Add(Format(SELECT_NEXT,[ATabela]));
  DMPrincipal.qryGenerica.Active := True;
  Result := DMPrincipal.qryGenerica.Fields[0].AsInteger;
  DMPrincipal.qryGenerica.Active := False;
end;

end.

