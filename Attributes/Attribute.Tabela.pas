unit Attribute.Tabela;

interface

uses
  System.Rtti;

type
  Tabela = class(TCustomAttribute)
  private
    FNome: string;
  public
    constructor Create(AValue: string);
    property Nome: string read FNome;
  end;

  Caption = class(TCustomAttribute)
  private
    FDescricao: string;
  public
    constructor Create(AValue: string);
    property Descricao: string read FDescricao;
  end;

implementation

{ Tabela }

constructor Tabela.Create(AValue: string);
begin
  FNome := AValue;
end;

{ Caption }

constructor Caption.Create(AValue: string);
begin
  FDescricao := AValue;
end;

end.
