unit Wrapper.Exception;

interface

uses
  SysUtils, vcl.Forms, System.Classes, dbxcommon, Data.DB, Vcl.Dialogs, Utils.Messages;

type
  TWrapperException = class
    public
      constructor Create;
      procedure TrataException(Sender: TObject; E : Exception);
  end;

var
  MinhaException : TWrapperException;

implementation

{ TException }

constructor TWrapperException.Create;
begin
  Application.OnException := TrataException;
end;

procedure TWrapperException.TrataException(Sender: TObject; E : Exception);
begin
  if E.ClassType = EMessage then
  begin
    TUtilsMessages.ShowMessage(E.Message);
    Exit;
  end;

  if E.ClassType = EMessageWarning then
  begin
    TUtilsMessages.ShowMessageWarning(E.Message);
    Exit;
  end;

  TUtilsMessages.ShowMessageExcept(E.Message);
end;

initialization
  MinhaException := TWrapperException.Create;

finalization
  MinhaException.Free;

end.
