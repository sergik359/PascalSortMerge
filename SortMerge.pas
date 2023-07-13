type arr=array[1..8] of integer;
const n = 8;
var  i: integer;
  A: arr:= (5,2,4,6,1,3,2,6);


procedure Merge(var A: arr; p, q, r: integer);
var middle, start, final , j: integer;
  mas: arr;
begin
  start:=p;
  final:=q + 1;
  for j:=p to r do
    if (start<=q) and ((final>r) or (A[start]<A[final])) then
    begin
      mas[j]:=A[start];
      inc(start);
    end
    else
    begin
      mas[j]:=A[final];
      inc(final);
    end;

  for j:=p to r do
    A[j]:=mas[j];
  end;

procedure Sort(var A: arr; p, r: integer);
var q: integer;
begin
  if p<r then
  begin
    q:= (p + r) div 2;
    Sort(A, p, q);
    Sort(A, q + 1, r);
    Merge(A, p, q, r);
  end;
end;

procedure PrintArr(var A: arr);
var i: integer;
begin
  for i:=1 to n do
    write(A[i], ' ');
  writeln;
end;

begin
  PrintArr(A);
  Sort(A, 1, n);
  writeln('Упорядоченный массив: ');
  PrintArr(A);
end.
