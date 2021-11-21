
CFLAGS = -Wall

objects = main.o lib-evaluator.o lib-tree.o

all: evaluator

evaluator: $(objects)
	gcc $(objects) -o evaluator $(LIBS)

main.o: main.c
	gcc -c main.c $(CFLAGS)

lib-evaluator.o: lib-evaluator.c lib-evaluator.h
	gcc -c lib-evaluator.c $(CFLAGS)

lib-tree.o: lib-tree.c lib-tree.h
	gcc -c lib-tree.c $(CFLAGS)

teste: 
	./evaluator \(*\(5\)\(+\(4\)\(3\)\)

clean:
	rm -f *.o

purge: clean
	rm -f evaluator
