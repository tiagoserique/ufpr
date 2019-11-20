program questao70;
const
        max = 100;
type
        matriz = record
                mat:array [1 .. max, 1 .. max] of integer;
                lin,col:integer;
                end;


function verlin(var quad:matriz; var soma:integer):boolean;
var
        vets:array [1 .. max] of integer;
        i,j:integer;
begin
        verlin:=true;

        for i:=1 to quad.lin do
                vets[i]:=0;

        for i:=1 to quad.lin do
        begin
                for j:=1 to quad.col do
                begin
                        read(quad.mat[i,j]);
                        vets[i]:=vets[i]+quad.mat[i,j];
                end;
        end;
        i:=1;
        while (i <= quad.lin-1) and (verlin) do
        begin
                if (vets[i] <> vets[i+1]) then
                        verlin:=false
                else
                        soma:=vets[i+1];
                i:=i+1;
        end;
end;


function vercol(quad:matriz; var soma:integer):boolean;
var
        vets:array [1 .. max] of integer;
        i,j:integer;
begin
        vercol:=true;

        for i:=1 to quad.col do
                vets[i]:=0;

        for i:=1 to quad.lin do
                for j:=1 to quad.col do
                        vets[i]:=vets[i]+quad.mat[j,i];
        i:=1;
        while (i <= quad.col-1) and (vercol) do
        begin
                if (vets[i] <> vets[i+1]) then
                        vercol:=false
                else
                        soma:=vets[i+1];
                i:=i+1;
        end;
end;


function verdia(quad:matriz; var soma:integer):boolean;
var
        i,j,princ,seq:integer;
begin
        verdia:=false;
        soma:=0;
        princ:=0;
        seq:=0;
        for i:=1 to quad.lin do
                princ:=princ+quad.mat[i,i];

        j:=quad.lin;
        for i:=1 to quad.lin do
        begin
                seq:=seq+quad.mat[i,j];
                j:=j-1;
        end;
        if (princ = seq) then
        begin
                verdia:=true;
                soma:=princ;
        end;
end;


var
        quad:matriz;
        i,ij,j:integer;
        co,dia,li:boolean;
begin
        read(quad.lin,quad.col);
        if (quad.lin = quad.col) then
        begin
                li:=verlin(quad,i);
                co:=vercol(quad,j);
                dia:=verdia(quad,ij);
                if ((co) and (li) and (not dia)) and ((i = j) and (j <> ij)) then
                        writeln('Eh quadrado quase magico')
                else
                        writeln('Nao eh quadrado quase magico');
        end;
end.
//6. Implemente o quadrado “quase magico”. Um quadrado quase magico ´e aquele
//em que as somas das linhas e a somas das colunas resultam em um mesmo
//valor, mas a soma dos elementos das diagonais n˜ao. O programa deve pedir a
//dimens˜ao do quadrado a ser impresso, que deve ser um n´umero ´ımpar entre 1 e
//99.
