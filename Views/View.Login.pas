unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, System.UITypes;

type
  TOpcao = (opLogar, opFecharAplicacao);

  TViewLogin = class(TForm)
    pnlBotoes: TPanel;
    pnlCentro: TPanel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FOpcaoEscolhida: TOpcao;
    function UsuarioAutenticado: Boolean;
  public
    { Public declarations }
  end;

var
  ViewLogin: TViewLogin;

implementation

uses
  Control.Login, Utils.Constants;

{$R *.dfm}

procedure TViewLogin.Button1Click(Sender: TObject);
begin
  if not UsuarioAutenticado then
    Exit;

  FOpcaoEscolhida := opLogar;
  Self.Close;
end;

function TViewLogin.UsuarioAutenticado: Boolean;
begin
  Result := TControlLogin.New
              .AutenticaLogin(Trim(edtUsuario.Text), Trim(edtSenha.Text));

  if not Result then
  begin
    ShowMessage('Usuário ou senha inválidos. Por favor tente novamente.');
    edtUsuario.SetFocus;
    edtUsuario.SelectAll;
  end;
end;

procedure TViewLogin.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TViewLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FOpcaoEscolhida = opFecharAplicacao then
    Application.Terminate;
end;

procedure TViewLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = TConstantsKeys.ENTER then
    Perform(WM_nextdlgctl, 0, 0);
end;

procedure TViewLogin.FormShow(Sender: TObject);
begin
  FOpcaoEscolhida := opFecharAplicacao;
  edtusuario.SetFocus;
end;

end.
