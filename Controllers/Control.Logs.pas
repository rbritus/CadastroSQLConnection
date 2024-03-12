unit Control.Logs;

interface

uses
  System.Classes, Model.Logs, System.SysUtils;

type
  IControlLog = interface
    procedure GravarLog(AMensagem: string);
    procedure RecuperaLog(const AStrings: TStrings);
    procedure EncerrarLog;
  end;

  TControlLog = class(TInterfacedObject,IControlLog)
  public
    procedure GravarLog(AMensagem: string);
    procedure RecuperaLog(const AStrings: TStrings);
    procedure EncerrarLog;

    class function New: IControlLog;
  end;

var
  FLog: TLog;

implementation

uses
  Utils.Constants;

{ TControlLog }

procedure TControlLog.EncerrarLog;
begin
  FLog.Free;
end;

procedure TControlLog.GravarLog(AMensagem: string);
begin
  var asd := GetCurrentDir;
  FLog.GravarLog(TConstantsFiles.ARQUIVO_LOG, AMensagem);
end;

class function TControlLog.New: IControlLog;
begin
  Result := Self.Create;

  if not Assigned(FLog) then
    FLog := TLog.New;
end;

procedure TControlLog.RecuperaLog(const AStrings: TStrings);
begin
  FLog.CarregarLog(TConstantsFiles.ARQUIVO_LOG, AStrings);
end;

end.
