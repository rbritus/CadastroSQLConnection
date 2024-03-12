unit View.Cadastro.TipoPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao.Cadastro, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Attribute.Tabela;

type
  [Tabela('TIPO_PESSOA')]
  [Caption('Tipos de Pessoa')]
  TViewCadastroTipoPessoa = class(TViewPadraoCadastro)
    Label1: TLabel;
    dbeId: TDBEdit;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    procedure dscMainStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCadastroTipoPessoa: TViewCadastroTipoPessoa;

implementation

{$R *.dfm}

procedure TViewCadastroTipoPessoa.dscMainStateChange(Sender: TObject);
begin
  inherited;
  if dscMain.State in [dsInsert,dsEdit] then
    dbeDescricao.SetFocus;

  if dscMain.State in [dsInsert] then
    Self.FDataSetCadastro.FieldByName('ID').AsInteger := Self.GetNextID;
end;

procedure TViewCadastroTipoPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  Self.FDataSetCadastro := Self.GetListClientDataSet.getCdsTipoPessoa;
  dscMain.DataSet := Self.FDataSetCadastro;
end;

end.
