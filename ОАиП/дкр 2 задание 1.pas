program SumArr;
const
  size = 5; 
var
  arr: array[1..size] of integer; 
  sum: integer; 
  i: integer; 
begin
  sum := 0;
  writeln('Введите элементы массива:');
  for i := 1 to size do
  begin
    readln(arr[i]);
  end;
  for i := 2 to size step 2 do
  begin
    sum := sum + arr[i];
  end;
  writeln('Сумма элементов на четных позициях: ', sum);
end.
