unit Factory.ClientDataSet;

interface

uses
  System.Classes, Data.DB, DM.Principal, Datasnap.DBClient;

type
  IFactoryDMClientDataSets = interface
  ['{03DB705E-6EA3-4826-A258-5C24F0E6B07C}']
    function getCdsUsuario: TClientDataSet;
    function getCdsTipoPessoa: TClientDataSet;
    function getCdsPessoa: TClientDataSet;
    function getCdsEndereco: TClientDataSet;
  end;

  TFactoryDMClientDataSets = class(TInterfacedObject, IFactoryDMClientDataSets)
  public
    function getCdsUsuario: TClientDataSet;
    function getCdsTipoPessoa: TClientDataSet;
    function getCdsPessoa: TClientDataSet;
    function getCdsEndereco: TClientDataSet;

    class function New: IFactoryDMClientDataSets;
  end;

implementation

{ TFactoryDMClientDataSets }

function TFactoryDMClientDataSets.getCdsEndereco: TClientDataSet;
begin
  Result := DMPrincipal.cdsEndereco;
end;

function TFactoryDMClientDataSets.getCdsPessoa: TClientDataSet;
begin
  Result := DMPrincipal.cdsPessoa;
end;

function TFactoryDMClientDataSets.getCdsTipoPessoa: TClientDataSet;
begin
  Result := DMPrincipal.cdsTipoPessoa;
end;

function TFactoryDMClientDataSets.getCdsUsuario: TClientDataSet;
begin
  Result := DMPrincipal.cdsUsuario;
end;

class function TFactoryDMClientDataSets.New: IFactoryDMClientDataSets;
begin
  Result := Self.Create;
end;

end.
