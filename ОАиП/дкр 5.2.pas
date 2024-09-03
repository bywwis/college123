program dkr5;
var
 a,ai:array [1..100] of integer;
 c:array [0..9] of string[100];
 i,n,l,li,j,s,k,h,b:integer;
 m:string;
 inputFile, outputFile: Text;
begin
  Assign(inputFile, 'input.txt');
  reset(inputFile);
  readln(inputFile, n);
  writeln('Исходный массив:');
 for i:=1 to n do
 begin
    readln(inputFile, a[i]);
    write(a[i],' ');
 end;
 writeln;
 for i:=1 to n do
  ai[i]:=a[i];
 for i:=1 to n do
 l:=0;
 b:=a[1];
 while b>0 do
 begin
  inc(l);
  b:=b div 10;
 end;
 for i:=1 to n do
 begin
  li:=0;
  b:=a[i];
  while b>0 do
  begin
   inc(li);
   b:=b div 10;
  end;
  if li>l then
   l:=li;   
  end;
 li:=1;
 for j:=l downto 1 do
 begin
  for i:=1 to n do
  begin
   b:=a[i] div li mod 10;
   str(i,m);
   c[b]:=c[b]+m+' ';
  end;
  li:=li*10;
  s:=1;
  for i:=0 to 9 do
  begin
   while pos(' ',c[i])>0 do
   begin
    m:=copy(c[i],1,pos(' ',c[i])-1);
    val(m,b,h);
    a[s]:=ai[b];
    inc(s);
    delete(c[i],1,pos(' ',c[i]));
    m:='';
   end;
   c[i]:='';
  end;
  for i:=1 to n do
   ai[i]:=a[i];
 end;
close(inputFile);
Assign(outputFile, 'output.txt');
rewrite(outputFile);
writeln('Отсортированный массив:');
 for i:=1 to n do
   begin 
    write(a[i],' ');
    write(outputFile, a[i], ' ');
   end;
close(outputFile);
end.