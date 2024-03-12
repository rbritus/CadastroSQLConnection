unit Repository.Usuario;

interface

uses
  System.Classes, System.SysUtils;

type
  TRepositoryUsuario = class
  public
    class function GetSqlPorUsuarioESenha: string;
  end;

implementation

uses
  Helper.Strings;

{ TRepositoryUsuario }

class function TRepositoryUsuario.GetSqlPorUsuarioESenha: string;
begin
  var LSql: string;
  LSql.append('SELECT');
  LSql.append('  LOGIN, ');
  LSql.append('  SENHA, ');
  LSql.append('  ADMINISTRADOR ');
  LSql.append('FROM ');
  LSql.append('  USUARIO ');
  LSql.append('WHERE ');
  LSql.append('  LOGIN = :LOGIN AND ');
  LSql.append('  SENHA = :SENHA ');

  Result := LSql;
end;

end.
