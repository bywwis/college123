program dkr3;

function Equation(x: real): real;
begin
  Equation := 1*x*x*x + (-1)*x*x + (-2)*x + 3;
end;

function LeftRectanglesMethod(a, b: real; n: integer): real;
var
  h, res, x: real;
  i: integer;
begin
  h := (b - a) / n;
  res := 0;
  for i := 0 to n - 1 do
  begin
    x := a + i * h;
    res := res + Equation(x);
  end;
  res := h * res;
  LeftRectanglesMethod := res;
end;

function EstimateError(a, b: real; n: integer): real;
var
  h, res, x: real;
  i: integer;
begin
  h := (b - a) / n;
  res := 0;
  for i := 0 to n - 1 do
  begin
    x := a + i * h;
    res := res + Equation(x);
  end;
  res := h * res;
  EstimateError := h*h; 
end;

procedure CalculateArea;
var
  a, b: real;
  n: integer;
  area, error: real;
begin
  write('Введите нижний предел интегрирования: ');
  readln(a);
  write('Введите верхний предел интегрирования: ');
  readln(b);
  write('Введите количество разбиений: ');
  readln(n);
  area := LeftRectanglesMethod(a, b, n);
  writeln('Площадь фигуры: ', area:0:4);  
  error := EstimateError(a, b, n);
  writeln('Погрешность: ', error:0:4);
end;

var
  choice: integer;

begin
  repeat
    writeln('1. Вычислить площадь фигуры');
    writeln('2. Выйти');
    write('Выберите действие: ');
    readln(choice);
    case choice of
      1: CalculateArea;
    end;
  until choice = 2;
end.
