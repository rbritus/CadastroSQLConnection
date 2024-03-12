unit View.Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TViewPadrao = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPadrao: TViewPadrao;

implementation

uses
  Utils.Constants,
  Helper.TForm;

{$R *.dfm}

procedure TViewPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.GravarPosicao;
end;

procedure TViewPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = TConstantsKeys.ENTER then
    Perform(WM_nextdlgctl, 0, 0);
end;

procedure TViewPadrao.FormShow(Sender: TObject);
begin
  Self.RecuperarPosicao;
end;

end.
