unit Helper.TForm;

interface

uses
  System.Classes,
  Vcl.DBGrids,
  Data.DB,
  Winapi.Windows,
  Vcl.Forms,
  Utils.IniFile,
  Winapi.Messages;

type
  TFormHelper = class helper for TForm
  public
    procedure GravarPosicao;
    procedure RecuperarPosicao;
  end;

implementation

uses
  Utils.Constants;

{ TFormHelper }

procedure TFormHelper.GravarPosicao;
begin
  TUtilsIniFile.New
    .Arquivo(TConstantsFiles.ARQUIVO_INI)
    .GuardarInteger(Self.Name, 'TOP', Self.Top)
    .GuardarInteger(Self.Name, 'LEFT', Self.Left)
    .GuardarInteger(Self.Name, 'WIDTH', Self.Width)
    .GuardarInteger(Self.Name, 'HEIGTH', Self.Height)
    .GuardarBool(Self.Name,'MAXIMIZED', Self.WindowState = TWindowState.wsMaximized);
end;

procedure TFormHelper.RecuperarPosicao;
begin
  var LIniFile := TUtilsIniFile.New
                    .Arquivo(TConstantsFiles.ARQUIVO_INI);

  Self.Top := LIniFile.LerInteger(Self.Name, 'TOP', Self.Top);
  Self.Left := LIniFile.LerInteger(Self.Name, 'LEFT', Self.Left);
  Self.Width := LIniFile.LerInteger(Self.Name, 'WIDTH', Self.Width);
  Self.Height := LIniFile.LerInteger(Self.Name, 'HEIGTH', Self.Height);
  var LMaximized := LIniFile.LerBool(Self.Name, 'Maximized', False);

  if LMaximized then
    Self.Perform(WM_SIZE, SIZE_MAXIMIZED, 0);
end;

end.
