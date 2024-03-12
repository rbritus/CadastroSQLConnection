unit View.Cadastro.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao.Cadastro, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Attribute.Tabela, Datasnap.DBClient, Vcl.Buttons;

type
  [Tabela('PESSOA')]
  [Caption('Pessoa')]
  TViewCadastroPessoa = class(TViewPadraoCadastro)
    Label1: TLabel;
    Label2: TLabel;
    dbeId: TDBEdit;
    dbeNome: TDBEdit;
    dbeCPF: TDBEdit;
    Label3: TLabel;
    dbeRG: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dscTipoPessoa: TDataSource;
    dbeStatus: TDBCheckBox;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    DBNavigator1: TDBNavigator;
    dscEndereco: TDataSource;
    procedure dscMainStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dscEnderecoStateChange(Sender: TObject);
  private
  public
    procedure PerssiteFilhos; override;
    procedure ExcluirFilhos; override;
  end;

var
  ViewCadastroPessoa: TViewCadastroPessoa;

implementation

{$R *.dfm}

procedure TViewCadastroPessoa.dscEnderecoStateChange(Sender: TObject);
begin
  inherited;
  if dscEndereco.State in [dsInsert] then
  begin
    dscEndereco.DataSet.FieldByName('ID').AsInteger := Self.GetNextID('ENDERECO');
    dscEndereco.DataSet.FieldByName('ID_PESSOA').AsInteger := Self.FDataSetCadastro.FieldByName('ID').AsInteger;
  end;
end;

procedure TViewCadastroPessoa.dscMainStateChange(Sender: TObject);
const
  ATIVO = 'A';
begin
  inherited;
  if dscMain.State in [dsInsert,dsEdit] then
    dbeNome.SetFocus;

  if dscMain.State in [dsInsert] then
  begin
    Self.FDataSetCadastro.FieldByName('ID').AsInteger := Self.GetNextID;
    Self.FDataSetCadastro.FieldByName('STATUS').AsString := ATIVO;
  end;
end;

procedure TViewCadastroPessoa.ExcluirFilhos;
begin
  inherited;
  while dscEndereco.DataSet.Eof do
    dscEndereco.DataSet.Delete;

  TClientDataSet(dscEndereco.DataSet).ApplyUpdates(0);
end;

procedure TViewCadastroPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  Self.FDataSetCadastro := Self.GetListClientDataSet.getCdsPessoa;
  dscMain.DataSet := Self.FDataSetCadastro;

  dscTipoPessoa.DataSet :=  Self.GetListClientDataSet.getCdsTipoPessoa;
  dscTipoPessoa.DataSet.Active := True;

  dscEndereco.DataSet :=  Self.GetListClientDataSet.getCdsEndereco;
  dscEndereco.DataSet.Active := True;
end;

procedure TViewCadastroPessoa.PerssiteFilhos;
begin
  inherited;
  TClientDataSet(dscEndereco.DataSet).ApplyUpdates(0);
end;

end.
