unit Control.Login;

interface

uses
  System.Classes, Data.DB, Entity.Usuario, System.SysUtils;

type
  IControlLogin = interface
  ['{CB41E8DF-59A1-45AA-93FD-7321CAB6C61A}']
    function AutenticaLogin(AUsuario, ASenha: string): Boolean;
    function UsuarioEhAdministrador: Boolean;
    function GetUsuarioLogado: IUsuario;
  end;

  TControlLogin = class(TInterfacedObject, IControlLogin)
  private
    procedure InstaciarUsuario;
    procedure RegistrarUsuario;
  public
    function AutenticaLogin(AUsuario, ASenha: string): Boolean;
    function UsuarioEhAdministrador: Boolean;
    function GetUsuarioLogado: IUsuario;

    class function New: IControlLogin;
  end;

var
  FUsuario: IUsuario;

implementation

uses
  DM.Principal, Repository.Usuario;

{ TControlLogin }

function TControlLogin.AutenticaLogin(AUsuario, ASenha: string): Boolean;
begin
  DMPrincipal.qryGenerica.Active := False;
  DMPrincipal.qryGenerica.SQL.Clear;
  DMPrincipal.qryGenerica.SQL.Add(TRepositoryUsuario.GetSqlPorUsuarioESenha);
  DMPrincipal.qryGenerica.ParamByName('LOGIN').AsString := AUsuario;
  DMPrincipal.qryGenerica.ParamByName('SENHA').AsString := ASenha;
  DMPrincipal.qryGenerica.Active := True;
  Result := not DMPrincipal.qryGenerica.IsEmpty;

  if Result then
    RegistrarUsuario;

  DMPrincipal.qryGenerica.Active := False;
end;

procedure TControlLogin.InstaciarUsuario;
begin
  if not Assigned(FUsuario) then
    FUsuario := TUsuario.New;
end;

class function TControlLogin.New: IControlLogin;
begin
  Result := Self.Create;
end;

procedure TControlLogin.RegistrarUsuario;
begin
  InstaciarUsuario;
  FUsuario
    .Login(DMPrincipal.qryGenerica.FieldByName('LOGIN').AsString)
    .Senha(DMPrincipal.qryGenerica.FieldByName('SENHA').AsString)
    .Admin(DMPrincipal.qryGenerica.FieldByName('ADMINISTRADOR').AsString);
end;

function TControlLogin.UsuarioEhAdministrador: Boolean;
const
  USUARIO_ADMINISTRADOR = 'S';
begin
  Result := FUsuario.Admin.Equals(USUARIO_ADMINISTRADOR);
end;

function TControlLogin.GetUsuarioLogado: IUsuario;
begin
  Result := FUsuario;
end;

end.
