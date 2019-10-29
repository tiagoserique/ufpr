-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210 2012-2 autor: Roberto Hexsel, 23set2015
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ESTE ARQUIVO NAO PODE SER ALTERADO

--------------------------------------------------------------------------
-- Material adaptado de VHDL Designer's Guide [Ashenden96], 
-- e Sistemas Digitais [Hexsel12].
--------------------------------------------------------------------------


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- inversor
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity inv is
  generic (prop : time := t_inv;
           cont : time := t_cont);
  port(A : in bit;
       S : out bit);
end inv;

architecture comport of inv is 
begin
    S <= reject cont inertial (not A) after prop;
end architecture comport;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta NAND de 2 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity nand2 is
  generic (prop : time := t_nand2;
           cont : time := t_cont);
  port(A,B : in bit;
       S   : out bit);
end nand2;

architecture comport of nand2 is 
begin
    S <= reject cont inertial (not(A and B)) after prop;
end architecture comport;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta NAND de 3 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity nand3 is
  generic (prop : time := t_nand3;
           cont : time := t_cont);
  port(A,B,C : in bit;
       S     : out bit);
end nand3;

architecture comport of nand3 is
begin
    S <= reject cont inertial (not(A and B and C)) after prop;
end architecture comport;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta NOR de 2 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity nor2 is
  generic (prop : time := t_nor2;
           cont : time := t_cont);
  port(A,B : in bit;
       S   : out bit);
end nor2;

architecture comport of nor2 is 
begin
    S <= reject cont inertial (not(A or B)) after prop;
end architecture comport;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta NOR de 3 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity nor3 is
  generic (prop : time := t_nor3;
           cont : time := t_cont);
  port(A,B,C : in bit;
       S     : out bit);
end nor3;

architecture comport of nor3 is
begin
    S <= reject cont inertial (not(A or B or C)) after prop;
end architecture comport;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta XOR de 2 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity xor2 is
  generic (prop : time := t_xor2;
           cont : time := t_cont);
  port(A,B : in bit;
       S   : out bit);
end xor2;

architecture comport of xor2 is 
begin
    S <= reject cont inertial (A xor B) after prop;
end architecture comport;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta XOR de 3 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity xor3 is
  generic (prop : time := t_xor3;
           cont : time := t_cont);
  port(A,B,C : in bit;
       S     : out bit);
end xor3;

architecture comport of xor3 is 
begin
    S <= reject cont inertial (A xor B xor C) after prop;
end architecture comport;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

