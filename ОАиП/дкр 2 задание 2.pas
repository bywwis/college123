program Palindrome;
const
  maxLen = 100; 
var
  str: string[maxLen]; 
  len: integer; 
  flag: boolean; 
  i: integer; 
begin
  writeln('Введите строку:');
  readln(str);
  len := length(str);
  flag := true; 
  for i := 1 to len div 2 do
  begin
    if str[i] <> str[len - i + 1] then 
    begin
      flag := false; 
      break;
    end;
  end;
  if flag then
    writeln('Строка является палиндромом')
  else
    writeln('Строка не является палиндромом');
end.
