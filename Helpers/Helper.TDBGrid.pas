unit Helper.TDBGrid;

interface

uses
  System.Classes,
  Vcl.DBGrids,
  Data.DB,
  Winapi.Windows,
  Vcl.Forms;

type
  TDBGridHelper = class helper for TDBGrid
  public
    procedure AjustaColunas;
  end;

implementation

{ TDBGridHelper }

procedure TDBGridHelper.AjustaColunas;
var
  TotalColumnWidth, ColumnCount, GridClientWidth, Filler, i: Integer;
begin
  ColumnCount := Self.Columns.Count;
  if ColumnCount = 0 then
    Exit;

  TotalColumnWidth := 0;
  for i := 0 to ColumnCount - 1 do
    TotalColumnWidth := TotalColumnWidth + Self.Columns[i].Width;
  if dgColLines in Self.Options then
    TotalColumnWidth := TotalColumnWidth + ColumnCount;

  GridClientWidth := Self.Width - GetSystemMetrics(SM_CXVSCROLL);
  if dgIndicator in Self.Options then
  begin
    GridClientWidth := GridClientWidth - IndicatorWidth;
    if dgColLines in Self.Options then
      Dec(GridClientWidth);
  end;
  if Self.BorderStyle = bsSingle then
  begin
    if Self.Ctl3D then
      GridClientWidth := GridClientWidth - 4
    else
      GridClientWidth := GridClientWidth - 2;
  end;

  if TotalColumnWidth < GridClientWidth then
  begin
    Filler := (GridClientWidth - TotalColumnWidth) div ColumnCount;
    for i := 0 to ColumnCount - 1 do
      Self.Columns[i].Width := Self.Columns[i].Width + Filler;
  end
  else if TotalColumnWidth > GridClientWidth then
  begin
    Filler := (TotalColumnWidth - GridClientWidth) div ColumnCount;
    if (TotalColumnWidth - GridClientWidth) mod ColumnCount <> 0 then
      Inc(Filler);
    for i := 0 to ColumnCount - 1 do
      Self.Columns[i].Width := Self.Columns[i].Width - Filler;
  end;
end;

end.
