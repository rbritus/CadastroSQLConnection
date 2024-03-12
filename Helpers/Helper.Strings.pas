unit Helper.Strings;

interface

uses
  System.SysUtils, System.Classes;

type
  THelperString = record helper for string
    procedure add(str: string); inline;
    procedure append(str: string); inline;
    procedure clear;
  end;

implementation

{ THelperString }

procedure THelperString.add(str: string);
begin
  Self := Self + str;
end;

procedure THelperString.append(str: string);
begin
  Self := Self + sLineBreak + str;
end;

procedure THelperString.clear;
begin
  Self := EmptyStr;
end;

end.
