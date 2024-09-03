program Functions;
var
  x: real;
function func(x: real): real;
begin
  if x < -7 then
    func := x / -x + -x
  else if (x >= -7) and (x < -5) then
    func := cos(x) * cos(x)
  else
    func := sin(x) - power(x, 0.1 * x);
end;
begin
  x := -9;
  while x <= -3 do
    begin
    writeln('f(', x:0:2, ') = ', func(x):0:2);
    x := x + 0.3;
    end;
end.



