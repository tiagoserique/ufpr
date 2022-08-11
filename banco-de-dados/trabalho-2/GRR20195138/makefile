
FLAGS = -Wall  
objects = main.o linked_list.o


all: compila


compila: $(objects)
	gcc $(objects) $(FLAGS) -o escalona


main.o: main.*
	gcc -c $(FLAGS) main.c


linked_list.o: linked_list.*
	gcc -c $(FLAGS) linked_list.c


clean:
	rm *.o


purge: clean
	rm escalona

	