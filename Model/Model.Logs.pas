unit Model.Logs;

interface

uses
  System.Classes,
  System.SysUtils;

type
  TLog = class
  public
    function CarregarLog(const AArquivoLog: string; const AStrings: TStrings): Boolean;
    function GravarLog(const AArquivoLog, AMensagem: string): Boolean;

    class function New: TLog;
  end;

implementation

var
  FInstance: TLog;

{ TLog }

class function TLog.New: TLog;
begin
  Result := FInstance;
end;

function TLog.CarregarLog(const AArquivoLog: string; const AStrings: TStrings): Boolean;
var
  stgLog: TStrings;
begin
  Result := False;

  if not (Assigned(AStrings) and FileExists(AArquivoLog)) then
  begin
    Exit;
  end;

  stgLog := TStringList.Create;

  try
    stgLog.LoadFromFile(AArquivoLog);

    if CompareText(AStrings.Text, stgLog.Text) <> 0 then
    begin
      AStrings.Text := stgLog.Text;
    end;

    Result := True;
  finally
    FreeAndNil(stgLog);
  end;
end;

function TLog.GravarLog(const AArquivoLog, AMensagem: string): Boolean;
var
  LArquivo: TextFile;
  LTexto: string;
  LDiretorio: string;

const
  LOG_MESSAGE = '%s';
  DATE_FORMAT = 'YYYY-MM-DD HH:NN:SS';
begin
  Result := False;
  LDiretorio := IncludeTrailingPathDelimiter(ExtractFilePath(AArquivoLog));

  if not (DirectoryExists(LDiretorio) or ForceDirectories(LDiretorio)) then
  begin
    Exit;
  end;

  AssignFile(LArquivo, AArquivoLog);

  case FileExists(AArquivoLog) of
    True : Append(LArquivo);
    False: Rewrite(LArquivo);
  end;

  LTexto := Format(LOG_MESSAGE, [FormatDateTime(DATE_FORMAT, Now)]);
  Writeln(LArquivo, AMensagem);
  Writeln(LArquivo, LTexto);
  WriteLn(LArquivo, '----------------------------------------------------------------------');
  WriteLn(LArquivo, '');
  CloseFile(LArquivo);
  Result := True;
end;

initialization
  FInstance := TLog.Create;

finalization
  FreeAndNil(FInstance);

end.
