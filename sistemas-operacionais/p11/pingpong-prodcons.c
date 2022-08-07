// GRR20195138 Tiago Serique Valadares
// PingPongOS - PingPong Operating System
// Prof. Carlos A. Maziero, DINF UFPR

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "ppos.h"
#include "queue.h"


// structures and defines ======================================================

#define true 1

typedef struct item {
    queue_t *prev;
    queue_t *next;
    int valor;
} item_t;

// headers =====================================================================


// global variables ============================================================


task_t p1, p2, p3;

task_t c1, c2;

semaphore_t s_vaga, s_buffer, s_item;

item_t *buffer = NULL;

// teste =======================================================================

void taskProdutor(void *arg){
   while ( true ){
        task_sleep(1000);
        
        item_t *item = (item_t *) malloc(sizeof(item_t));

        if ( !item ){
            perror("Error");
            exit(1);
        }

        item->prev = NULL;
        item->next = NULL;
        item->valor = rand() % 100;

        sem_down(&s_vaga);
        sem_down(&s_buffer);
        
        printf("%s produziu %d\n", (char *) arg, item->valor);

        // insere item no buffer
        queue_append((queue_t **) &buffer, (queue_t *) item);

        sem_up(&s_buffer);
        sem_up(&s_item);
   }

   task_exit(0);
}


void taskConsumidor(void *arg){
   while ( true ){
        sem_down(&s_item);
        sem_down(&s_buffer);
        
        // retira item do buffer
        item_t *item = buffer;
        queue_remove((queue_t **) &buffer, (queue_t *) item);
        
        sem_up(&s_buffer);
        sem_up(&s_vaga);

        // print item
        printf("%s consumiu %d\n", (char *) arg, item->valor);

        task_sleep(1000);
   }

   task_exit(0);
}


int main(){
    printf("Main inicio:\n");

    ppos_init();

    srand(time(NULL));

    // cria semaforos
    sem_create(&s_vaga, 5);
    sem_create(&s_buffer, 1);
    sem_create(&s_item, 0);

    // cria tarefas
    task_create(&p1, taskProdutor, (void *) "p1");
    task_create(&p2, taskProdutor, (void *) "p2");
    task_create(&p3, taskProdutor, (void *) "p3");
    task_create(&c1, taskConsumidor, (void *) "\t\t\tc1");
    task_create(&c2, taskConsumidor, (void *) "\t\t\tc2");

    
    task_join(&p1);

    task_sleep(20000);

    printf("Main fim:\n");

    task_exit(0);

    exit(0);
}