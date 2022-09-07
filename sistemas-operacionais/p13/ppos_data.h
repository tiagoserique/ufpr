// GRR20195138 Tiago Serique Valadares
// PingPongOS - PingPong Operating System
// Prof. Carlos A. Maziero, DINF UFPR
// Versão 1.4 -- Janeiro de 2022

// Estruturas de dados internas do sistema operacional

#ifndef __PPOS_DATA__
#define __PPOS_DATA__

#include <ucontext.h>		// biblioteca POSIX de trocas de contexto
#include "queue.h"


#define STACKSIZE 64*1024

#define TASK_READY     1
#define TASK_RUNNING   2
#define TASK_SUSPENDED 3
#define TASK_FINISHED  4

#define MIN_PRIO    20
#define DEFAUL_PRIO 0
#define MAX_PRIO    -20
#define TASK_AGING  1

#define QUANTUM_DEFAULT 20

#define TRUE  1
#define FALSE 0

// print the elements of the queue test
void print_queue(void *element);

// Estrutura que define um Task Control Block (TCB)
typedef struct task_t
{
    struct task_t *prev, *next;     // ponteiros para usar em filas
    struct task_t *suspendedQueue;  // fila de tarefas suspensas
    
    int id;				            // identificador da tarefa
    ucontext_t context;			    // contexto armazenado da tarefa
    
    short status;			        // pronta, rodando, suspensa, ...
    short preemptable;			    // pode ser preemptada?
    int exit_code;			        // valor de retorno da tarefa
    
    short static_prio;              // prioridade estática
    short dynamic_prio;             // prioridade dinâmica
    
    unsigned int execution_time;    // tempo de execução da tarefa
    unsigned int processor_time;    // tempo de processamento da tarefa
    unsigned int activations;       // número de vezes que a tarefa foi ativada

    unsigned int awake_time;        // tempo em que a tarefa tem que ser acordada           
} task_t ;

// estrutura que define um semáforo
typedef struct semaphore_t
{
    int count;                        // quantidade de tarefas na fila
    int destroyed;                    // indica se o semáforo foi destruído

    task_t *queue;                    // fila de tarefas esperando no semáforo
} semaphore_t ;

// estrutura que define um mutex
typedef struct mutex_t
{
  // preencher quando necessário
} mutex_t ;

// estrutura que define uma barreira
typedef struct barrier_t
{
  // preencher quando necessário
} barrier_t ;

// estrutura que define uma fila de mensagens
typedef struct mqueue_t
{
    int msg_size;                     // tamanho dos dados da mensagem
    int max_msgs;                     // tamanho máximo da fila
    int count_msgs;                   // número de mensagens na fila

    void *queue;                      // fila de mensagens
    int start;                        // índice do primeiro elemento da fila
    int end;                          // índice do último elemento da fila

    semaphore_t s_vaga;               // sinaliza a vaga da fila
    semaphore_t s_item;               // sinaliza o item da fila
    semaphore_t s_buffer;             // sinaliza o buffer da fila
} mqueue_t ;



extern task_t *readyQueue;     // fila de tarefas prontas
extern task_t *suspendedQueue; // fila de tarefas suspensas
extern task_t *currentTask;
extern task_t dispatcherTask;
extern int isUserTask;

#endif

