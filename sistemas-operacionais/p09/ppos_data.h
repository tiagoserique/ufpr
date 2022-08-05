// GRR20195138 Tiago Serique Valadares
// PingPongOS - PingPong Operating System
// Prof. Carlos A. Maziero, DINF UFPR
// Versão 1.4 -- Janeiro de 2022

// Estruturas de dados internas do sistema operacional

#ifndef __PPOS_DATA__
#define __PPOS_DATA__

#include <ucontext.h>		// biblioteca POSIX de trocas de contexto


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
  // ... (outros campos serão adicionados mais tarde)
} task_t ;

// estrutura que define um semáforo
typedef struct
{
  // preencher quando necessário
} semaphore_t ;

// estrutura que define um mutex
typedef struct
{
  // preencher quando necessário
} mutex_t ;

// estrutura que define uma barreira
typedef struct
{
  // preencher quando necessário
} barrier_t ;

// estrutura que define uma fila de mensagens
typedef struct
{
  // preencher quando necessário
} mqueue_t ;

#endif

