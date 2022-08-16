
FLAGS = -Wall  
objects = main.o utils.o graph.o linked_list.o


all: compila


compila: $(objects)
	gcc $(objects) $(FLAGS) -o escalona


main.o: main.*
	gcc -c $(FLAGS) main.c


utils.o: utils.*
	gcc -c $(FLAGS) utils.c


graph.o: graph.*
	gcc -c $(FLAGS) graph.c


linked_list.o: linked_list.*
	gcc -c $(FLAGS) linked_list.c


clean:
	rm *.o


purge: clean
	rm escalona

	