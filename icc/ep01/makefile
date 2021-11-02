LIBS = -lm -I/usr/include -L/usr/lib -lmatheval


all:
	gcc -Wall ep01.c $(LIBS) -o ep01

teste: 
	./ep01 < sample.in > saida.csv

clean:
	rm ep01

purge: clean
	rm saida.csv
