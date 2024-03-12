unit View.Logs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls;

type
  TViewLog = class(TViewPadrao)
    pnlCentral: TPanel;
    pnlBotoes: TPanel;
    btnFechar: TButton;
    memLog: TMemo;
    Timer1: TTimer;
    swtScrollMemo: TToggleSwitch;
    Label1: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewLog: TViewLog;

implementation

uses
  Utils.Constants;

{$R *.dfm}

procedure TViewLog.btnFecharClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TViewLog.Timer1Timer(Sender: TObject);
begin
  inherited;
  if not FileExists(TConstantsFiles.ARQUIVO_LOG) then
    Exit;

  memLog.Lines.LoadFromFile(TConstantsFiles.ARQUIVO_LOG);
  if swtScrollMemo.State = tssOn  then
    memLog.Perform(WM_VSCROLL,SB_PAGEDOWN,0);
end;

end.
