unit Control.Conexao;

interface

uses
  System.Classes, Data.DB, DM.Principal, Datasnap.DBClient, Factory.ClientDataSet;

type
  IControlConexao = interface
  ['{13781562-3489-4371-8713-AEF44BE05C4D}']
    function IniciarTransacao: IControlConexao;
    function Commitar: IControlConexao;
    function Rollback: IControlConexao;
    function GetListaClientDataSet: IFactoryDMClientDataSets;
    function GetProximoID(ATabela: string): Integer;
  end;

  TControlConexao = class(TInterfacedObject, IControlConexao)
  private
    FListaCds: IFactoryDMClientDataSets;
    constructor Create;
  public
    function IniciarTransacao: IControlConexao;
    function Commitar: IControlConexao;
    function Rollback: IControlConexao;
    function GetListaClientDataSet: IFactoryDMClientDataSets;
    function GetProximoID(ATabela: string): Integer;

    class function New: IControlConexao;
  end;

implementation

uses
  System.SysUtils;

{ TControlConexao }

function TControlConexao.Commitar: IControlConexao;
begin
  Result := Self;
  DMPrincipal.Commit;
end;

constructor TControlConexao.Create;
begin
  inherited;
  FListaCds := TFactoryDMClientDataSets.New;
end;

function TControlConexao.GetListaClientDataSet: IFactoryDMClientDataSets;
begin
  Result := FListaCds;
end;

function TControlConexao.GetProximoID(ATabela: string): Integer;
begin
  Result := DMPrincipal.GetProximoID(ATabela);
end;

function TControlConexao.IniciarTransacao: IControlConexao;
begin
  Result := Self;
  DMPrincipal.IniciarTransacao;
end;

class function TControlConexao.New: IControlConexao;
begin
  Result := Self.Create;
end;

function TControlConexao.Rollback: IControlConexao;
begin
  Result := Self;
  DMPrincipal.Rollback;
end;

end.
