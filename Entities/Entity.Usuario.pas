unit Entity.Usuario;

interface

uses
  System.Classes;

type
  IUsuario = interface
  ['{499190D0-A718-4AB6-AC85-5BF935616AD1}']
     function Login: string; overload;
     function Login(AValue: string): IUsuario; overload;
     function Senha: string; overload;
     function Senha(AValue: string): IUsuario; overload;
     function Admin: string; overload;
     function Admin(AValue: string): IUsuario; overload;
  end;

  TUsuario = class(TInterfacedObject, IUsuario)
  private
    FLogin: string;
    FSenha: string;
    FAdmin: string;
  public
     function Login: string; overload;
     function Login(AValue: string): IUsuario; overload;
     function Senha: string; overload;
     function Senha(AValue: string): IUsuario; overload;
     function Admin: string; overload;
     function Admin(AValue: string): IUsuario; overload;

    class function New: IUsuario;
  end;

implementation

{ TUsuario }

function TUsuario.Admin(AValue: string): IUsuario;
begin
  Result := Self;
  FAdmin := AValue;
end;

function TUsuario.Admin: string;
begin
  Result := FAdmin;
end;

function TUsuario.Login(AValue: string): IUsuario;
begin
  Result := Self;
  FLogin := AValue;
end;

function TUsuario.Login: string;
begin
  Result := FLogin;
end;

class function TUsuario.New: IUsuario;
begin
  Result := Self.Create;
end;

function TUsuario.Senha(AValue: string): IUsuario;
begin
  Result := Self;
  FSenha := AValue;
end;

function TUsuario.Senha: string;
begin
  Result := FSenha;
end;

end.
