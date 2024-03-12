program prjTesteAtak;

uses
  Vcl.Forms,
  View.Principal in 'Views\View.Principal.pas' {ViewPrincipal},
  View.Login in 'Views\View.Login.pas' {ViewLogin},
  DM.Principal in 'DataModules\DM.Principal.pas' {DMPrincipal: TDataModule},
  Control.Login in 'Controllers\Control.Login.pas',
  Repository.Usuario in 'Repositorys\Repository.Usuario.pas',
  Helper.Strings in 'Helpers\Helper.Strings.pas',
  Utils.Constants in 'Utils\Utils.Constants.pas',
  View.Padrao in 'Views\View.Padrao.pas' {ViewPadrao},
  View.Padrao.Cadastro in 'Views\View.Padrao.Cadastro.pas' {ViewPadraoCadastro},
  View.Cadastro.Login in 'Views\View.Cadastro.Login.pas' {ViewCadastroLogin},
  Control.Conexao in 'Controllers\Control.Conexao.pas',
  Factory.ClientDataSet in 'Factorys\Factory.ClientDataSet.pas',
  Control.Views in 'Controllers\Control.Views.pas',
  Utils.Validacoes in 'Utils\Utils.Validacoes.pas',
  View.Consulta.Generica in 'Views\View.Consulta.Generica.pas' {ViewConsultaGenerica},
  Helper.TDBGrid in 'Helpers\Helper.TDBGrid.pas',
  Attribute.Tabela in 'Attributes\Attribute.Tabela.pas',
  Helper.Attributes in 'Helpers\Helper.Attributes.pas',
  Utils.Rtti in 'Utils\Utils.Rtti.pas',
  Entity.Usuario in 'Entities\Entity.Usuario.pas',
  Utils.Messages in 'Utils\Utils.Messages.pas',
  Wrapper.Exception in 'Wrappers\Wrapper.Exception.pas',
  View.Cadastro.TipoPessoa in 'Views\View.Cadastro.TipoPessoa.pas' {ViewCadastroTipoPessoa},
  Helper.TForm in 'Helpers\Helper.TForm.pas',
  Utils.IniFile in 'Utils\Utils.IniFile.pas',
  Model.TempoOcioso in 'Model\Model.TempoOcioso.pas',
  Control.TempoOcioso in 'Controllers\Control.TempoOcioso.pas',
  View.Cadastro.Pessoa in 'Views\View.Cadastro.Pessoa.pas' {ViewCadastroPessoa},
  Model.Logs in 'Model\Model.Logs.pas',
  Control.Logs in 'Controllers\Control.Logs.pas',
  View.Logs in 'Views\View.Logs.pas' {ViewLog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '';
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TViewLogin, ViewLogin);
  ViewLogin.ShowModal;
  Application.Run;
end.
