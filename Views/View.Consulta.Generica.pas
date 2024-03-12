unit View.Consulta.Generica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, System.UITypes;

type
  TProcedureRetorno = reference to procedure (ASelecionado: Boolean);

  IViewConsultaGenerica = interface
  ['{368D8973-59B0-434F-A795-89F2466CABFB}']
    function InformarCaption(ACaption: string): IViewConsultaGenerica;
    function SetDataSetPesquisa(ADataSet: TDataSet): IViewConsultaGenerica;
    procedure ShowConsulta(AObjProc: TProcedureRetorno);
  end;

  TViewConsultaGenerica = class(TViewPadrao, IViewConsultaGenerica)
    DataSource1: TDataSource;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btnSelecionar: TButton;
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FObjProc: TProcedureRetorno;
    FDataSet: TDataSet;
    FSelecionado: Boolean;
  public
    class function New: IViewConsultaGenerica;
    function InformarCaption(ACaption: string): IViewConsultaGenerica;
    function SetDataSetPesquisa(ADataSet: TDataSet): IViewConsultaGenerica;
    procedure ShowConsulta(AObjProc: TProcedureRetorno);
  end;

var
  ViewConsultaGenerica: TViewConsultaGenerica;

implementation

uses
  Helper.TDBGrid;

{$R *.dfm}

{ TViewConsultaGenerica }

procedure TViewConsultaGenerica.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  if DataSource1.DataSet.IsEmpty then
    Exit;

  FSelecionado := True;
  Close;
end;

procedure TViewConsultaGenerica.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if DataSource1.DataSet.IsEmpty then
    Exit;

  FSelecionado := True;
  Close;
end;

procedure TViewConsultaGenerica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FObjProc(FSelecionado);
  Action := TCloseAction.caFree;
end;

procedure TViewConsultaGenerica.FormCreate(Sender: TObject);
begin
  inherited;
  FSelecionado := False;
end;

function TViewConsultaGenerica.InformarCaption(ACaption: string): IViewConsultaGenerica;
begin
  Result := Self;
  Self.Caption := ACaption;
end;

class function TViewConsultaGenerica.New: IViewConsultaGenerica;
begin
  Result := TViewConsultaGenerica.Create(Application.MainForm);
end;

function TViewConsultaGenerica.SetDataSetPesquisa(ADataSet: TDataSet): IViewConsultaGenerica;
begin
  Result := Self;
  FDataSet := ADataSet;
  DataSource1.DataSet := FDataSet;
  DBGrid1.AjustaColunas;
end;

procedure TViewConsultaGenerica.ShowConsulta(AObjProc: TProcedureRetorno);
begin
  Self.Show;
  FObjProc := AObjProc;
end;

end.
