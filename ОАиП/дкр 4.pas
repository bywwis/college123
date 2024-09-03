program FindIntegral;

uses CRT,GraphABC;
const
  NORM = LightGray; 
  SEL = Green;
  K = 2;

var
  menu: array[1..K] of string;
  punkt: integer;
  ch: char;
  x_menu, y_menu: integer;

function Calculations(var x, h: real): real;
var
  value_f: real;
begin
  value_f := h * (1 * x * x * x + (-1) * x * x + (-2) * x + (3));
  Calculations := value_f;
end;

function Calculations_NL(var x: real): real;
var
  value_f_NL: real;
begin
  value_f_NL := ((x * x * x * x) / 4) - ((x * x * x) / 3) - (x * x) + (3 * x);
  Calculations_NL := value_f_NL;
end;

var
  x, h, a, b, sum_f, fun, integral, f_a, f_b, error: real;
  N,kk: integer;

procedure DrawGraph;
var
  gx, gy, x0, y0, x1, y1, i: integer;
  x, y: real;
begin
  ClearWindow;
  SetBrushColor(clWhite);
  gx := N * 10 + 30;
  gy := 700;
  SetWindowSize(gx, gy);
  x0 := 20;
  y0 := gy - 100;
  Line(x0, y0, trunc(gx+h*kk*10), y0);
  TextOut(trunc(gx+h*kk*10), y0 + 10, 'X');

  Line(x0, 10, x0, y0);
  Line(x0, 10, x0 - 10, 20);
  Line(x0, 10, x0 + 10, 20);
  TextOut(x0 - 10, 20, 'Y');

  for i := 0 to N do
  begin
    Line(x0 + (i * kk), y0 - kk, x0 + (i * kk), y0 + kk);
    TextOut(x0 + (i * kk), y0 + kk, IntToStr(i));
  end;

  for i := -N to 0 do
  begin
    Line(x0 - kk, y0 + (i * kk), x0 + kk, y0 + (i * kk));
    if i <> 0 then
      TextOut(x0 + k, y0 + (i * kk), IntToStr(-i));
  end;


  x := a;
  MoveTo(x0, y0 - Trunc((1*x * x * x + (-1) * x * x + (-2) * x + (3)) * kk));

  while x <= b do
  begin
    y := 1*x * x * x + (-1) * x * x + (-2) * x + (3); 

    x1 := Trunc(x0 + x * kk);
    y1 := Trunc(y0 - Trunc(y * kk)); 
    SetBrushColor(clBlack);
    Rectangle(x1, y1, trunc(x1+h*kk), y0);
    
    LineTo(x1 + Trunc(h), y1);
    
    x := x + h;
  end;
end;

procedure KeyDown(Key: integer);
begin
  case Key of
    VK_Up:   kk := kk + 5;
    VK_Down: kk := kk - 5;
  end;

  DrawGraph;
end;

procedure PlotGraph(a, b, h: real; N: integer);
begin
  kk := 10;
  OnKeyDown := KeyDown;

  DrawGraph;
end;

procedure punkt1;
begin
  ClrScr;
  var i: integer;
  repeat
  begin
    writeln('Введите пределы интегрирования через пробел:');
    readln(a, b);
    CLRSCR;
    writeln('Введите количество разделений:');
    readln(N);
    CLRSCR;
    h := (b - a) / (N - 1);
    x := a;
    sum_f := 0;
    f_a := Calculations_NL(a);
    f_b := Calculations_NL(b);
    integral := f_b - f_a;
    for i := 0 to (N - 1) do
    begin
      fun := Calculations(x, h);
      sum_f := sum_f + fun;
      x := x + h;
    end;
    sum_f := abs(sum_f);
    error := sum_f - integral;
    writeln('Результат вычислений:', sum_f);
    writeln('Абсолютная погрешность: ', error);
    PlotGraph(a,b,h,N);
    ch := readkey;
    end;
  until ch = #13;
end;

procedure MenuToScr;
var
  i: integer;
begin
  ClrScr;
  for i := 1 to K do
  begin
    GoToXY(x_menu, y_menu + i - 1);
    write(menu[i]);
  end;
  TextColor(Blue);
  GoToXY(x_menu, y_menu + punkt - 1);
  write(menu[punkt]);
  TextColor(NORM);
end;

begin
  SetConsoleIO;
  menu[1] := ' Найти интеграл '; 
  menu[2] := ' Выход ';
  punkt := 1; 
  x_menu := 2; 
  y_menu := 2; 
  TextColor(NORM);
  MenuToScr;
  repeat
    ch := ReadKey;
    if ch = #0 then
    begin
      ch := ReadKey;
      case ch of
        #40: {Вниз}
          if punkt < K then
          begin
            GoToXY(x_menu, y_menu + punkt - 1);
            write(menu[punkt]);
            punkt := punkt + 1;
            TextColor(Blue);
            GoToXY(x_menu, y_menu + punkt - 1);
            write(menu[punkt]);
            TextColor(NORM);
          end;
        #38: {Вверх}
          if punkt > 1 then
          begin
            GoToXY(x_menu, y_menu + punkt - 1);
            write(menu[punkt]);
            punkt := punkt - 1;
            TextColor(Blue);
            GoToXY(x_menu, y_menu + punkt - 1);
            write(menu[punkt]);
            TextColor(NORM);
          end;
      end;
    end
    else
    if ch = #13 then
    begin
      case punkt of
        1: punkt1;
        2: ch := #27;
      end;
      MenuToScr;
    end;
  until ch = #27;
end.
