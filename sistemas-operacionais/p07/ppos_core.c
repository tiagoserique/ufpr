// GRR20195138 Tiago Serique Valadares
// PingPongOS - PingPong Operating System
// Prof. Carlos A. Maziero, DINF UFPR
// Versão 1.4 -- Janeiro de 2022

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/time.h>
#include "ppos.h"
#include "queue.h"


// headers =====================================================================

// responsable for determining the next task for each context switch
task_t *scheduler();

// responsable for general control of the system
void dispatcher();

// the handler for the SIGALRM signal
void tick_handler();

// print the elements of the queue test
void print_queue(void *element);

// global variables ============================================================

// variables used to manipulate the tasks
task_t MainTask, *CurrentTask, DispatcherTask, *ReadyQueue;

// tasks IDs, counter of user tasks and quantum counter
int tid, userTask, quantum;

// register the time elapsed since the first tick
unsigned int system_time;

// struct that defines a signal handler (must be global or static)
struct sigaction action;

// struct that defines the timer
struct itimerval timer;

// another functions ===========================================================

void print_queue(void *element){
    task_t *task = (task_t *) element;

    printf("%d <- %d -> %d ", task->prev->id, task->id, task->next->id);
    task = task->next;
}

// funções gerais ==============================================================

void ppos_init(){
    /* disable the stdout buffer, used by printf */
    setvbuf(stdout, 0, _IONBF, 0);

    // register the SIGALRM signal handler
    action.sa_handler = tick_handler;
    sigemptyset(&action.sa_mask);
    action.sa_flags = 0 ;
    if ( sigaction(SIGALRM, &action, 0) < 0 ){
        perror("Erro em sigaction: ");
        exit(1);
    }

    // ajust the timer to fire after 1ms
    timer.it_value.tv_usec = 1000;      // first timer interrupt in ms
    timer.it_value.tv_sec  = 0;         // first timer interrupt in s
    timer.it_interval.tv_usec = 1000;   // recurring timer interrupt in ms
    timer.it_interval.tv_sec  = 0;      // recurring timer interrupt in s

    // set the ITIMER_REAL timer
    if (setitimer(ITIMER_REAL, &timer, 0) < 0){
        perror("ppos_init: set timer");
        exit(1);
    }

    // initialize global variables
    tid         = 0; 
    userTask    = 1;
    CurrentTask = NULL;
    ReadyQueue  = NULL;
    quantum     = QUANTUM_DEFAULT;

    // create the main task
    MainTask.prev   = NULL;
    MainTask.next   = NULL;
    MainTask.id     = tid;
    MainTask.status = TASK_RUNNING;
    MainTask.static_prio  = DEFAUL_PRIO;
    MainTask.dynamic_prio = DEFAUL_PRIO;
    MainTask.preemptable  = 1;
    MainTask.execution_time = systime();
    MainTask.processor_time = 0;
    MainTask.activations    = 0;

    // append main task to the ready queue
    queue_append((queue_t **) &ReadyQueue, (queue_t *) &MainTask);

    // set main task as current task
    CurrentTask = &MainTask;

    // create the task for dispatcher
    task_create(&DispatcherTask, dispatcher, NULL);

    task_yield();
}

// gerência de tarefas =========================================================

int task_create(task_t *task, void (*start_routine)(void *), void *arg){
    // check if the task is null
    if ( !task ){
        perror("task_create: task is NULL");
        return -7;
    }

    // check if the start routine is null
    if ( !start_routine ){
        perror("task_create: start_routine is NULL");
        return -8;    
    }
    
    // check if the task is already created
    if ( getcontext(&(task->context)) < 0 ){
        perror("task_create: getcontext");
        return -9;    
    }

    // check if the task's stack was allocated
    char *stack = malloc(STACKSIZE);
    if ( !stack ){
        perror("task_create: malloc stack");
        return -10;    
    }

    // fill the TCB with the information of the task
    tid++;
    task->prev = NULL;
    task->next = NULL;
    task->id   = tid;
    task->status = TASK_READY;
    task->static_prio  = DEFAUL_PRIO;
    task->dynamic_prio = DEFAUL_PRIO;
    task->preemptable  = 0;
    task->execution_time = systime();
    task->processor_time = 0;
    task->activations    = 0;

    // create the task context
    task->context.uc_stack.ss_sp    = stack;
    task->context.uc_stack.ss_size  = STACKSIZE;
    task->context.uc_stack.ss_flags = 0;
    task->context.uc_link           = 0;

    makecontext(&(task->context), (void*)start_routine, 1, arg);


    #ifdef DEBUG
    printf("task_create: criou tarefa %d\n", task->id);
    #endif


    // return the id if the id is from the dispatcher
    if ( tid == 1 ) return task->id;


    // if it is a user task, so increase the counter of user tasks, the task is 
    // preemptable and add the task to the ready queue
    userTask++;
    task->preemptable = 1;
    queue_append((queue_t **) &ReadyQueue, (queue_t *) task);

    return task->id;
}


int task_switch(task_t *task){
    // check if the task is null
    if ( !task ){
        perror("task_switch: task is NULL");
        return -7;
    }

    // increase the task's activations
    task->activations++;

    task_t *cTask = CurrentTask; 
    CurrentTask   = task;


    #ifdef DEBUG
    printf("task_switch: trocando contexto %d -> %d\n", cTask->id, task->id);
    #endif


    // switch the context
    if ( swapcontext(&(cTask->context), &(task->context)) < 0 ){
        perror("task_switch: swapcontext");
        return -11;
    }

    return 0;
}


void task_exit(int exit_code){
    task_t *cTask = CurrentTask;

    // set the task's status to finished
    cTask->status = TASK_FINISHED;

    // calculate the task's execution time
    cTask->execution_time = systime() - cTask->execution_time;

    // check if the task is the dispatcher
    // if it is not, decrease the number of user tasks
    if ( task_id() != 1 ) userTask--;


    #ifdef DEBUG
    printf("task_exit: tarefa %d sendo encerrada\n", cTask->id);
    #endif


    // output the task's information
    printf("Task %d exit: execution time %d ms, processor time %d ms, %d activations\n", 
    cTask->id, cTask->execution_time, cTask->processor_time, cTask->activations);

    // if the current task is the dispatcher, switch to the main task
    // otherwise, switch to the dispatcher task
    if ( cTask == &DispatcherTask ) task_switch(&MainTask);
    else task_switch(&DispatcherTask);
}


int task_id(){
    // check if the current task is null
    if ( !CurrentTask ){
        perror("task_id: CurrentTask is NULL");
        return -12;
    } 

    return CurrentTask->id;
}

// operações de escalonamento ==================================================

void tick_handler(){
    task_t *cTask = CurrentTask;

    // add the 1ms to the system time 
    system_time++;

    // check if the task is preemptable
    if ( cTask->preemptable ){
        quantum--;
        
        // check if the quantum is finished
        if ( quantum == 0 ){

            // reset the quantum
            quantum = QUANTUM_DEFAULT;

            task_yield();
        }
    }
}


task_t *scheduler(){
    task_t *taskMaxPriority, *firstTaskReady, *task;
    
    // get the first task ready on the queue
    firstTaskReady = ReadyQueue;

    // check if the queue is empty
    if ( !firstTaskReady ) return NULL;
    
    // update the task's dynamic priority
    task = firstTaskReady->next;
    firstTaskReady->dynamic_prio -= TASK_AGING;
    while ( task != firstTaskReady ){
        if ( task->dynamic_prio > MAX_PRIO ) task->dynamic_prio -= TASK_AGING;
        
        task = task->next;
    }

    // search for the task with the highest priority
    taskMaxPriority = firstTaskReady;
    task = firstTaskReady->next;
    while ( task != firstTaskReady ){
        if ( task->dynamic_prio < taskMaxPriority->dynamic_prio ){
            taskMaxPriority = task;
        }
     
        task = task->next;
    }

    // reset the task's dynamic priority to task's static priority
    taskMaxPriority->dynamic_prio = task_getprio(taskMaxPriority);

    return taskMaxPriority;
}


void dispatcher(){
    // while there are user tasks 
    while ( userTask ){
        
        #ifdef DEBUG
        queue_print("Ready queue", (queue_t *) ReadyQueue, (void *) print_queue);
        #endif


        // get the next task
        task_t *nextTask = scheduler();

        // if the scheduler choose a task and the task is not null
        if ( nextTask ){

            // set status to running and remove the task from the ready queue
            nextTask->status = TASK_RUNNING;
            queue_remove((queue_t **) &ReadyQueue, (queue_t *) nextTask);


            // get the system time before switch to the next task  
            // switch to the next task
            // get the total time that the task was running
            // and increase the task's processor time
            unsigned int process_task_time = systime();
            task_switch(nextTask);
            process_task_time = systime() - process_task_time;
            nextTask->processor_time += process_task_time;


            // handles all possible task status cases 
            switch ( nextTask->status ){
                case TASK_READY:
                    // add the task to the ready queue
                    queue_append((queue_t **) &ReadyQueue, (queue_t *) nextTask);
                break;
                
                case TASK_FINISHED:
                    // destroy the task's stack
                    free(nextTask->context.uc_stack.ss_sp);
                break;
            }
        }
    }

    // finish the dispatcher
    task_exit(0);
}


void task_yield(){
    task_t *cTask = CurrentTask;

    // set the task's status to ready
    cTask->status = TASK_READY;

    // pass the control to the dispatcher
    task_switch(&DispatcherTask);
}


void task_setprio(task_t *task, int prio){
    task_t *cTask = CurrentTask;

    if ( prio > MIN_PRIO ) prio = MIN_PRIO;

    // check if the task is null
    // if it is, set the task's priority to the current task
    // otherwise, set the task's priority to the given task
    if ( !task ){
        cTask->static_prio  = prio;
        cTask->dynamic_prio = prio;
    }  
    else { 
        task->static_prio  = prio;
        task->dynamic_prio = prio;
    }
}


int task_getprio(task_t *task){
    task_t *cTask = CurrentTask;

    // check if the task is null
    // if it is, return the current task's priority
    // otherwise, return the task's priority
    return ( !task ) ? cTask->static_prio : task->static_prio;
}

// operações de gestão do tempo ================================================

unsigned int systime(){
    // return the system time
    return system_time;
}

