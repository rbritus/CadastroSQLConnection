unit View.Padrao.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, View.Padrao,
  Factory.ClientDataSet, data.DB, Datasnap.DBClient, System.UITypes;

type
  TStatusCadastro = (scInserindo, scEditando);

  TViewPadraoCadastro = class(TViewPadrao)
    pnlBotoes: TPanel;
    btnGravar: TButton;
    btnFechar: TButton;
    btnCancelar: TButton;
    btnPesquisar: TButton;
    btnExcluir: TButton;
    pnlCentral: TPanel;
    dscMain: TDataSource;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dscMainStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FPesquisaEmUso: Boolean;
    FPrimeiroFoco: Boolean;
    FStatusCadastro: TStatusCadastro;
    procedure SetStatusCadastro(const Value: TStatusCadastro);

    procedure MudarBotoesParaInserindo;
    procedure MudarBotoesParaEditando;
    procedure AcaoCancelar;
  protected
    FDataSetCadastro: TClientDataSet;
    function GetNextID: Integer; overload;
    function GetNextID(ATabela: string): Integer; overload;
    procedure PerssiteFilhos; virtual;
    procedure ExcluirFilhos; virtual;
  public
    function GetListClientDataSet: IFactoryDMClientDataSets;
  end;

var
  ViewPadraoCadastro: TViewPadraoCadastro;

implementation

uses
  Control.Conexao,
  View.Consulta.Generica,
  Utils.Rtti, Utils.Messages;

{$R *.dfm}

procedure TViewPadraoCadastro.btnCancelarClick(Sender: TObject);
begin
  inherited;
  AcaoCancelar;
end;

procedure TViewPadraoCadastro.btnFecharClick(Sender: TObject);
begin
  inherited;
  FDataSetCadastro.Cancel;
  Self.Close;
end;

procedure TViewPadraoCadastro.btnGravarClick(Sender: TObject);
begin
  inherited;
  try
    FDataSetCadastro.Post;
    FDataSetCadastro.ApplyUpdates(0);
    PerssiteFilhos;
    TControlConexao.New
      .Commitar;
  except
    on E: Exception do
    begin
      FDataSetCadastro.CancelUpdates;
      TControlConexao.New
        .Rollback;

      raise Exception.Create(E.Message);
    end;
  end;

  FDataSetCadastro.Append;
end;

procedure TViewPadraoCadastro.AcaoCancelar;
begin
  FDataSetCadastro.Cancel;
  FDataSetCadastro.Append;
end;

procedure TViewPadraoCadastro.btnPesquisarClick(Sender: TObject);
const
  CAPTION = 'Pesquisar por: %s';
begin
  inherited;

  if FPesquisaEmUso then
  begin
    TUtilsMessages.ShowMessageWarning('Pesquisa já em uso.');
    Exit;
  end;

  FPesquisaEmUso := True;
  FDataSetCadastro.Cancel;

  TViewConsultaGenerica.New
    .InformarCaption(Format(CAPTION,[TUtilsRtti.ObterCaptionTabela(Self)]))
    .SetDataSetPesquisa(FDataSetCadastro)
    .ShowConsulta(
      procedure (ASelecionado: Boolean)
      begin
        FPesquisaEmUso := False;
        if not ASelecionado then
        begin
          AcaoCancelar;
          Exit;
        end;

        FDataSetCadastro.Edit;
      end
    );
end;

procedure TViewPadraoCadastro.dscMainStateChange(Sender: TObject);
begin
  inherited;
  case dscMain.State of
    dsInsert : SetStatusCadastro(scInserindo);
    dsEdit : SetStatusCadastro(scEditando);
  end;
end;

procedure TViewPadraoCadastro.ExcluirFilhos;
begin

end;

procedure TViewPadraoCadastro.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if not TUtilsMessages.ShowMensagemConfirmacao('Deseja excluir o registro?') then
    Exit;

  try
    FDataSetCadastro.Cancel;
    FDataSetCadastro.Delete;
    FDataSetCadastro.ApplyUpdates(0);
    ExcluirFilhos;

    TControlConexao.New
      .Commitar;
  except
    on E: Exception do
    begin
      FDataSetCadastro.CancelUpdates;
      TControlConexao.New
        .Rollback;

      raise Exception.Create(E.Message);
    end;
  end;

  FDataSetCadastro.Append;
end;

procedure TViewPadraoCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if FPesquisaEmUso then
  begin
    TUtilsMessages.ShowMessageWarning('Finalize a pesquisa antes de fechar a tela.');
    Action := TCloseAction.caNone;
  end;
end;

procedure TViewPadraoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  TControlConexao.New
    .IniciarTransacao;
  SetStatusCadastro(scInserindo);
  FPrimeiroFoco := True;
end;

procedure TViewPadraoCadastro.FormShow(Sender: TObject);
begin
  inherited;
  if not FDataSetCadastro.Active then
    FDataSetCadastro.Active := True;

  if FPrimeiroFoco then
  begin
    FDataSetCadastro.Append;
    FPrimeiroFoco := False;
  end;
end;

function TViewPadraoCadastro.GetListClientDataSet: IFactoryDMClientDataSets;
begin
  Result := TControlConexao.New
              .GetListaClientDataSet;
end;

function TViewPadraoCadastro.GetNextID(ATabela: string): Integer;
begin
  Result := TControlConexao.New
              .GetProximoID(ATabela);
end;

function TViewPadraoCadastro.GetNextID: Integer;
begin
  Result := TControlConexao.New
              .GetProximoID(TUtilsRtti.ObterTabela(Self));
end;

procedure TViewPadraoCadastro.MudarBotoesParaEditando;
begin
  btnExcluir.Enabled := True;
  btnPesquisar.Enabled := False;
end;

procedure TViewPadraoCadastro.MudarBotoesParaInserindo;
begin
  btnExcluir.Enabled := False;
  btnPesquisar.Enabled := True;
end;

procedure TViewPadraoCadastro.PerssiteFilhos;
begin

end;

procedure TViewPadraoCadastro.SetStatusCadastro(const Value: TStatusCadastro);
begin
  FStatusCadastro := Value;
  case FStatusCadastro of
    scInserindo: MudarBotoesParaInserindo;
    scEditando: MudarBotoesParaEditando;
  end;
end;

end.
