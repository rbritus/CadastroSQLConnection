unit Utils.Rtti;

interface

uses
  Generics.Collections, Rtti, Classes, Attribute.Tabela,
  System.SysUtils, Helper.Attributes, System.TypInfo, Data.DB;

type
  TUtilsRtti = class
  public
    class function ObterTabela(AObject: TObject): string; overload;
    class function ObterTabela(AObject: TDataSet): string; overload;
    class function ObterCaptionTabela(AObject: TObject): string; static;
  end;

implementation

{ TUtilsEntidade }

class function TUtilsRtti.ObterCaptionTabela(AObject: TObject): string;
var
  vCtxRtti: TRttiContext;
  vTypRtti: TRttiType;
begin
  vCtxRtti := TRttiContext.Create;
  try
    vTypRtti := vCtxRtti.GetType(AObject.ClassInfo);
    if vTypRtti.TemAtributo<Caption> then
      Result := vTypRtti.GetAttribute<Caption>.Descricao;
  finally
    vCtxRtti.Free;
  end;
end;

class function TUtilsRtti.ObterTabela(AObject: TObject): string;
var
  vCtxRtti: TRttiContext;
  vTypRtti: TRttiType;
begin
  vCtxRtti := TRttiContext.Create;
  try
    vTypRtti := vCtxRtti.GetType(AObject.ClassInfo);
    if vTypRtti.TemAtributo<Tabela> then
      Result := vTypRtti.GetAttribute<Tabela>.Nome;
  finally
    vCtxRtti.Free;
  end;
end;

class function TUtilsRtti.ObterTabela(AObject: TDataSet): string;
var
  vCtxRtti: TRttiContext;
  vTypRtti: TRttiType;
begin
  vCtxRtti := TRttiContext.Create;
  try
    vTypRtti := vCtxRtti.GetType(AObject.Owner.ClassInfo);

    for var FField in vTypRtti.GetFields do
    begin
      if FField.Name = AObject.Name then
      begin
        if FField.TemAtributo<Tabela> then
          Result := FField.GetAttribute<Tabela>.Nome;

        Break;
      end;
    end;
    if vTypRtti.TemAtributo<Caption> then
      Result := vTypRtti.GetAttribute<Caption>.Descricao;
  finally
    vCtxRtti.Free;
  end;
end;

end.
