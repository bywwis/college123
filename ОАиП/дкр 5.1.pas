program dkr5;
var a,b:array[1..100] of integer;
    n,i,j,k:integer;
    inputFile, outputFile: Text;
begin
Assign(inputFile, 'input.txt');
reset(inputFile);
readln(inputFile, n);
writeln('Исходный массив:');
for i:= 1 to n do
 begin
  readln(inputFile, a[i]);
  write(a[i],' ');
 end;
writeln;
for i:=1 to n do
b[i]:=-1;
for i:=1 to n do
 begin
  k:=0;
  for j:=1 to n do
  if a[j]<a[i] then k:=k+1;
  b[k+1]:=a[i];
 end;
for i:=2 to n do
if b[i]=-1 then b[i]:=b[i-1];
close(inputFile);
Assign(outputFile, 'output.txt');
rewrite(outputFile);
writeln('Отсортированный массив:');
for i:=1 to n do
begin
write(b[i],' ');
write(outputFile, b[i], ' ');
end;
close(outputFile);
end.