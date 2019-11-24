program bordas;
const
   MAX    = 512;
   PRETO  = 0;
   BRANCO = 255;
   LIMIAR =  40;
type
   TpImagem = array[1..MAX, 1..MAX] of integer;
var
   im, imB:TpImagem;
   numLin, numCol, numMax: integer;


procedure clareiaImagem( var im:TpImagem;
                    var numLin, numCol:integer);
var
   i, j: integer;
begin
   for i:= 1 to numLin do
      for j:= 1 to numCol do
      begin
         im[i,j]:=im[i,j]+50;
	 if (im[i,j] < PRETO) then
	     im[i,j]:=PRETO;
      end;
end;


procedure leImagem( var im:TpImagem; 
                    var numLin, numCol, numMax: integer );
var
   id: string[10];
   i, j: integer;
begin
   readln( id );
   readln( numCol, numLin );
   readln( numMax );
   for i:= 1 to numLin do
      for j:= 1 to numCol do
	 read( im[i,j] );
end;

procedure detectaBordas( var m, mB:TpImagem; numLin, numCol: integer );
var
   i, j: integer;
begin
   for i:=1 to numLin do 
   begin
      mB[i,1]:= PRETO;
      mB[i,numCol]:= PRETO;
   end;
   for j:= 1 to numCol do
   begin
      mB[1,j]:= PRETO;
      mB[numLin,j]:= PRETO;
   end;
   for i:= 2 to numLin-1 do
      for j:= 2 to numCol-1 do
	 if abs(m[i,j]*4 -(m[i-1,j]+m[i+1,j]+m[i,j-1]+m[i,j+1])) > LIMIAR then
	    mB[i,j]:= BRANCO
	 else
	    mB[i,j]:= PRETO;
end;

procedure escreveImagem( var im:TpImagem; numLin, numCol, numMax: integer );
var
   i, j: integer;
begin
   writeln( 'P2');
   writeln( numCol:5, numLin:5 );
   writeln( numMax );
   for i:= 1 to numLin do
   begin
      for j:= 1 to numCol do
	 write( im[i, j]:5 );
      writeln;
   end;
end;	

begin
   leImagem( im, numLin, numCol, numMax );
   //detectaBordas( im, imB, numLin, numCol);
   clareiaImagem(im, numLin, numCol);
   escreveImagem( im, numLin, numCol, BRANCO );
end.
//Clarear uma imagem no formato PGM
