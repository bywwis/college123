unit LeviCurveModule;

interface

uses GraphWPF;

procedure DrawLevi(Level: Integer; x0, y0, x1, y1: Real);

implementation

procedure DrawLevi(Level: Integer; x0, y0, x1, y1: Real);
begin
  if Level > 0 then
  begin
    var
      (x, y) := ((x0 + x1) / 2 + (y1 - y0) / 2, (y0 + y1) / 2 - (x1 - x0) / 2);
      DrawLevi(Level - 1, x0, y0, x, y);
      DrawLevi(Level - 1, x, y, x1, y1); 
  end
  else
    Line(x0, y0, x1, y1);
end;
end.