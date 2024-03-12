unit Control.TempoOcioso;

interface

uses
  System.Classes, Model.TempoOcioso;

type
  TControlTempoOcioso = class
  private
    FModelTempoOcioso: TModelTempoOcioso;
  public
    function Excecute: TControlTempoOcioso;
    destructor Destroy; override;

    class function New: TControlTempoOcioso;
  end;

implementation

{ TControlTempoOcioso }

destructor TControlTempoOcioso.Destroy;
begin
  FModelTempoOcioso.Free;
end;

function TControlTempoOcioso.Excecute: TControlTempoOcioso;
begin
  Result := Self;
  FModelTempoOcioso := TModelTempoOcioso.New;
end;

class function TControlTempoOcioso.New: TControlTempoOcioso;
begin
  Result := Self.Create;
end;

end.
