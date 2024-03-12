unit Model.TempoOcioso;

interface

uses
  System.Classes, Winapi.Windows, Vcl.ExtCtrls, Vcl.Forms;

type

  TModelTempoOcioso = class
  private
    constructor Create;
  public
     class procedure LigaTimer(Sender: TObject; var Done: Boolean);
     class procedure DesligaTimer(var MSG: tagMSG; var Handled: Boolean);
     class procedure TimerOciosoTimer(Sender: TObject);

    class function New: TModelTempoOcioso;
  end;

var
  FTimerOcioso: TTimer;

implementation

uses
  View.Login;

{ TModelTempoOcioso }

constructor TModelTempoOcioso.Create;
const
  DOIS_MINUTOS = 120000;
begin
  FTimerOcioso := TTimer.Create(nil);
  FTimerOcioso.Interval := DOIS_MINUTOS;
end;

class procedure TModelTempoOcioso.DesligaTimer(var MSG: tagMSG; var Handled: Boolean);
begin
  FTimerOcioso.Enabled := False;
end;

class procedure TModelTempoOcioso.LigaTimer(Sender: TObject; var Done: Boolean);
begin
  FTimerOcioso.Enabled := True;
end;

class function TModelTempoOcioso.New: TModelTempoOcioso;
begin
  Result := Self.Create;
  Application.OnIdle := LigaTimer;
  Application.OnMessage := DesligaTimer;
  FTimerOcioso.OnTimer := TimerOciosoTimer;
end;

class procedure TModelTempoOcioso.TimerOciosoTimer(Sender: TObject);
begin
  ViewLogin.ShowModal;
end;

end.
