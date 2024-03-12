unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Control.TempoOcioso;

type
  TViewPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Usurios1: TMenuItem;
    pnlView: TPanel;
    ipodePessoas1: TMenuItem;
    Pessoa1: TMenuItem;
    Utilirios1: TMenuItem;
    Log1: TMenuItem;
    procedure Usurios1Click(Sender: TObject);
    procedure ipodePessoas1Click(Sender: TObject);
    procedure TimerOciosoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Pessoa1Click(Sender: TObject);
    procedure Log1Click(Sender: TObject);
  private
    FControlTempoOcioso: TControlTempoOcioso;
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

uses
  View.Cadastro.Login, Control.Views, View.Cadastro.TipoPessoa,
  View.Cadastro.Pessoa, View.Logs;

{$R *.dfm}

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  FControlTempoOcioso := TControlTempoOcioso.New
                           .Excecute;
end;

procedure TViewPrincipal.FormDestroy(Sender: TObject);
begin
  FControlTempoOcioso.Free;
end;

procedure TViewPrincipal.ipodePessoas1Click(Sender: TObject);
begin
  ControlView
    .ShowForm(TViewCadastroTipoPessoa);
end;

procedure TViewPrincipal.Log1Click(Sender: TObject);
begin
  ControlView
    .ValidaUsuarioAdministrador
    .ShowForm(TViewLog);
end;

procedure TViewPrincipal.Pessoa1Click(Sender: TObject);
begin
  ControlView
    .ShowForm(TViewCadastroPessoa);
end;

procedure TViewPrincipal.TimerOciosoTimer(Sender: TObject);
begin
  ShowMessage('Timer ocioso');
end;

procedure TViewPrincipal.Usurios1Click(Sender: TObject);
begin
  ControlView
    .ValidaUsuarioAdministrador
    .ShowForm(TViewCadastroLogin);
end;

end.
