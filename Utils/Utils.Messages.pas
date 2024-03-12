unit Utils.Messages;

interface

uses
  System.Classes, System.SysUtils, Winapi.Windows, Vcl.Dialogs, System.UITypes;

type
  EMessage = Class(Exception);
  EMessageWarning = Class(Exception);

  TUtilsMessages = class
  private
  public
    class procedure ShowMessage(const AMensagem: string); static;
    class procedure ShowMessageWarning(const AMensagem: string); static; static;
    class procedure ShowMessageExcept(const AMensagem: string); static; static;
    class function ShowMensagemConfirmacao(const AMessage: String): Boolean; static;
  end;

implementation

{ TUtilsMessages }

class procedure TUtilsMessages.ShowMessageExcept(const AMensagem: string);
begin
  var lMensagem := AMensagem + sLineBreak + 'Por favo entre em contato com o suporte.';
  MessageDlg(lMensagem, TMsgDlgType.mtError, [mbOk], 0, mbOk);
end;

class procedure TUtilsMessages.ShowMessageWarning(const AMensagem: string);
begin
  MessageDlg(AMensagem, TMsgDlgType.mtWarning, [mbOk], 0, mbOk);
end;

class procedure TUtilsMessages.ShowMessage(const AMensagem: string);
begin
  MessageDlg(AMensagem, TMsgDlgType.mtInformation, [mbOk], 0, mbOk);
end;

class function TUtilsMessages.ShowMensagemConfirmacao(const AMessage: String): Boolean;
begin
  Result := MessageDlg(AMessage, mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes;
end;

end.
