unit Utils.IniFile;

interface

uses
  Classes, System.IniFiles;

type
  IUtilsIniFile = interface
    function Arquivo(ALocal: string): IUtilsIniFile;
    function LerString(const AChave, ACampo, Default: string): string;
    function LerInteger(const AChave, ACampo: string; Default: Integer): Integer;
    function LerBool(const AChave, ACampo: string; Default: Boolean): Boolean;
    function LerDate(const AChave, ACampo: string; Default: TDateTime): TDateTime;
    function LerDateTime(const AChave, ACampo: string; Default: TDateTime): TDateTime;
    function LerFloat(const AChave, ACampo: string; Default: Double): Double;
    function GuardarString(const AChave, ACampo, AValor: String): IUtilsIniFile;
    function GuardarInteger(const AChave, ACampo: string; AValor: Integer): IUtilsIniFile;
    function GuardarBool(const AChave, ACampo: string; AValor: Boolean): IUtilsIniFile;
    function GuardarDate(const AChave, ACampo: string; AValor: TDateTime): IUtilsIniFile;
    function GuardarDateTime(const AChave, ACampo: string; AValor: TDateTime): IUtilsIniFile;
    function GuardarFloat(const AChave, ACampo: string; AValor: Double): IUtilsIniFile;
  end;

  TUtilsIniFile = class(TInterfacedObject, IUtilsIniFile)
  private
    FIniFile: TIniFile;
  public
    function Arquivo(ALocal: string): IUtilsIniFile;
    function LerString(const AChave, ACampo, Default: string): string;
    function LerInteger(const AChave, ACampo: string; Default: Integer): Integer;
    function LerBool(const AChave, ACampo: string; Default: Boolean): Boolean;
    function LerDate(const AChave, ACampo: string; Default: TDateTime): TDateTime;
    function LerDateTime(const AChave, ACampo: string; Default: TDateTime): TDateTime;
    function LerFloat(const AChave, ACampo: string; Default: Double): Double;
    function GuardarString(const AChave, ACampo, AValor: String): IUtilsIniFile;
    function GuardarInteger(const AChave, ACampo: string; AValor: Integer): IUtilsIniFile;
    function GuardarBool(const AChave, ACampo: string; AValor: Boolean): IUtilsIniFile;
    function GuardarDate(const AChave, ACampo: string; AValor: TDateTime): IUtilsIniFile;
    function GuardarDateTime(const AChave, ACampo: string; AValor: TDateTime): IUtilsIniFile;
    function GuardarFloat(const AChave, ACampo: string; AValor: Double): IUtilsIniFile;

    class function New: IUtilsIniFile;
    destructor Destroy; override;
  end;

implementation

{ TUtilsIniFile }

function TUtilsIniFile.Arquivo(ALocal: string): IUtilsIniFile;
begin
  Result := Self;
  FIniFile := TIniFile.Create(ALocal);
end;

destructor TUtilsIniFile.Destroy;
begin
  FIniFile.Free;
end;

function TUtilsIniFile.GuardarBool(const AChave, ACampo: string;
  AValor: Boolean): IUtilsIniFile;
begin
  Result := Self;
  FIniFile.WriteBool(AChave, ACampo, AValor);
end;

function TUtilsIniFile.GuardarDate(const AChave, ACampo: string;
  AValor: TDateTime): IUtilsIniFile;
begin
  Result := Self;
  FIniFile.WriteDate(AChave, ACampo, AValor);
end;

function TUtilsIniFile.GuardarDateTime(const AChave, ACampo: string;
  AValor: TDateTime): IUtilsIniFile;
begin
  Result := Self;
  FIniFile.WriteDateTime(AChave, ACampo, AValor);
end;

function TUtilsIniFile.GuardarFloat(const AChave, ACampo: string;
  AValor: Double): IUtilsIniFile;
begin
  Result := Self;
  FIniFile.WriteFloat(AChave, ACampo, AValor);
end;

function TUtilsIniFile.GuardarInteger(const AChave, ACampo: string;
  AValor: Integer): IUtilsIniFile;
begin
  Result := Self;
  FIniFile.WriteInteger(AChave, ACampo, AValor);
end;

function TUtilsIniFile.GuardarString(const AChave, ACampo,
  AValor: String): IUtilsIniFile;
begin
  Result := Self;
  FIniFile.WriteString(AChave, ACampo, AValor);
end;

function TUtilsIniFile.LerBool(const AChave, ACampo: string;
  Default: Boolean): Boolean;
begin
  Result := FIniFile.ReadBool(AChave, ACampo, Default);
end;

function TUtilsIniFile.LerDate(const AChave, ACampo: string;
  Default: TDateTime): TDateTime;
begin
  Result := FIniFile.ReadDate(AChave, ACampo, Default);
end;

function TUtilsIniFile.LerDateTime(const AChave, ACampo: string;
  Default: TDateTime): TDateTime;
begin
  Result := FIniFile.ReadDateTime(AChave, ACampo, Default);
end;

function TUtilsIniFile.LerFloat(const AChave, ACampo: string;
  Default: Double): Double;
begin
  Result := FIniFile.ReadFloat(AChave, ACampo, Default);
end;

function TUtilsIniFile.LerInteger(const AChave, ACampo: string;
  Default: Integer): Integer;
begin
  Result := FIniFile.ReadInteger(AChave, ACampo, Default);
end;

function TUtilsIniFile.LerString(const AChave, ACampo, Default: string): string;
begin
  Result := FIniFile.ReadString(AChave, ACampo, Default);
end;

class function TUtilsIniFile.New: IUtilsIniFile;
begin
  Result := Self.Create;
end;

end.
