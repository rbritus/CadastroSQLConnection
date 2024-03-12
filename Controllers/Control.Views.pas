unit Control.Views;

interface

uses
  System.Classes, Vcl.Forms, System.Generics.Collections, Vcl.Controls;

type
  TControlView = class
  private
    ListaForm: TDictionary<TComponentClass, TForm>;
    function CarregarForm(Value: TComponentClass): TForm;
    procedure AdicionarFormNalista(Value: TComponentClass; var AForm: TForm);
  public
    function ValidaUsuarioAdministrador: TControlView;
    procedure ShowForm(Value: TComponentClass);
    constructor Create;
    destructor Destroy; override;
  end;

var
  ControlView : TControlView;

implementation

uses
  System.SysUtils, Control.Login, Utils.Messages;

{ TControllerView }

destructor TControlView.Destroy;
begin
  FreeAndNil(ListaForm);
  inherited;
end;

constructor TControlView.Create;
begin
  ListaForm := TDictionary<TComponentClass, TForm>.Create;
end;

procedure TControlView.AdicionarFormNalista(Value: TComponentClass; var AForm: TForm);
begin
  if not ListaForm.TryGetValue(Value, AForm) then
  begin
    Application.CreateForm(Value, AForm);
    ListaForm.Add(Value, AForm);
  end;
end;

function TControlView.CarregarForm(Value: TComponentClass): TForm;
var
  AForm: TForm;
begin
  AdicionarFormNalista(Value,AForm);
  Result := AForm;
end;

procedure TControlView.ShowForm(Value: TComponentClass);
begin
  var Form := CarregarForm(Value);
  Form.Show;
end;

function TControlView.ValidaUsuarioAdministrador: TControlView;
begin
  Result := Self;
  if not TControlLogin.New
           .UsuarioEhAdministrador  then
    raise EMessageWarning.Create('Usuário sem previlégios de administrador.');
end;

initialization
  ControlView := TControlView.Create;

finalization
  ControlView.Free;

end.
