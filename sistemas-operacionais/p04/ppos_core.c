// GRR20195138 Tiago Serique Valadares
// PingPongOS - PingPong Operating System
// Prof. Carlos A. Maziero, DINF UFPR
// Versão 1.4 -- Janeiro de 2022

#include <stdio.h>
#include <stdlib.h>
#include "ppos.h"
#include "queue.h"


// headers =====================================================================

// responsable for determining the next task for each context switch
task_t *scheduler();

// responsable for general control of the system
void dispatcher();


// global variables ============================================================

task_t MainTask, *CurrentTask, DispatcherTask, *ReadyQueue;

int tid, userTask;


// funções gerais ==============================================================

void ppos_init(){
    /* disable the stdout buffer, used by printf */
    setvbuf(stdout, 0, _IONBF, 0);

    // initialize global variables
    tid         = 0; 
    userTask    = 0;
    CurrentTask = NULL;
    ReadyQueue  = NULL;

    // create the main task
    MainTask.prev   = NULL;
    MainTask.next   = NULL;
    MainTask.id     = tid;
    MainTask.status = TASK_RUNNING;
    MainTask.static_prio  = DEFAUL_PRIO;
    MainTask.dynamic_prio = DEFAUL_PRIO;

    // set main task as current task
    CurrentTask = &MainTask;

    // create the task for dispatcher
    task_create(&DispatcherTask, dispatcher, NULL);
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

    // create the task context
    task->context.uc_stack.ss_sp    = stack;
    task->context.uc_stack.ss_size  = STACKSIZE;
    task->context.uc_stack.ss_flags = 0;
    task->context.uc_link           = 0;

    makecontext(&(task->context), (void*)start_routine, 1, arg);

    #ifdef DEBUG
    printf("task_create: criou tarefa %d\n", task->id);
    #endif

    // return the task's id if the id is from the main task or the dispatcher
    if ( tid <= 1 ) return task->id;
    
    userTask++;
    
    // add the task to the ready queue
    queue_append((queue_t **) &ReadyQueue, (queue_t *) task);

    return task->id;
}


int task_switch(task_t *task){
    // check if the task is null
    if ( !task ){
        perror("task_switch: task is NULL");
        return -7;
    }

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

    // check if the task is the main task or the dispatcher
    // if it is not, decrease the number of user tasks
    if ( task_id() > 1 ) userTask--;

    #ifdef DEBUG
    printf("task_exit: tarefa %d sendo encerrada\n", cTask->id);
    #endif

    // if the current task is the dispatcher, switch to the main task
    // otherwise, switch to the dispatcher task
    ( cTask == &DispatcherTask ) ? task_switch(&MainTask) : task_switch(&DispatcherTask);
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
        if ( task->dynamic_prio > MAX_PRIO ){
            task->dynamic_prio -= TASK_AGING;
        }
        
        task = task->next;
    }

    // search for the task with the highest priority
    taskMaxPriority = firstTaskReady;
    task = firstTaskReady->next;

    while ( task != firstTaskReady ){
        if ( task->dynamic_prio <= taskMaxPriority->dynamic_prio )
            taskMaxPriority = task;
     
        task = task->next;
    }

    // reset the task's dynamic priority to task's static priority
    taskMaxPriority->dynamic_prio = task_getprio(taskMaxPriority);

    return taskMaxPriority;
}


void dispatcher(){
    // while there are user tasks 
    while ( userTask ){

        // get the next task
        task_t *nextTask = scheduler();

        // if the scheduler choose a task and it is not null
        if ( nextTask ){

            // set status to running
            nextTask->status = TASK_RUNNING;
            
            // remove the task from the ready queue
            queue_remove((queue_t **) &ReadyQueue, (queue_t *) nextTask);

            // switch to the next task
            task_switch(nextTask);

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

    if ( prio < MAX_PRIO ) prio = MAX_PRIO;

    // check if the task is null
    // if it is, set the task's priority to the current task
    // otherwise, set the task's priority to the given task with the given priority
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

