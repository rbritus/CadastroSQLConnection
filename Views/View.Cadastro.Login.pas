unit View.Cadastro.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao.Cadastro, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Attribute.Tabela;

type
  [Tabela('USUARIO')]
  [Caption('Usuário')]
  TViewCadastroLogin = class(TViewPadraoCadastro)
    dbeLogin: TDBEdit;
    dbeAdministrador: TDBCheckBox;
    dbeSenha: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dscMainStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCadastroLogin: TViewCadastroLogin;

implementation

{$R *.dfm}

procedure TViewCadastroLogin.dscMainStateChange(Sender: TObject);
const
  NAO = 'N';
begin
  inherited;
  if dscMain.State in [dsInsert,dsEdit] then
    dbeLogin.SetFocus;

  if dscMain.State in [dsInsert] then
    Self.FDataSetCadastro.FieldByName('administrador').AsString := NAO;
end;

procedure TViewCadastroLogin.FormCreate(Sender: TObject);
begin
  inherited;
  Self.FDataSetCadastro := Self.GetListClientDataSet.getCdsUsuario;
  dscMain.DataSet := Self.FDataSetCadastro;
end;

end.
