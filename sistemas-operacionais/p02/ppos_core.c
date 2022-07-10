
#include <stdio.h>
#include <stdlib.h>
#include "ppos.h"


task_t MainTask, *CurrentTask;

int tid = 0;


void ppos_init(){
    /* disable the stdout buffer, used by printf */
    setvbuf(stdout, 0, _IONBF, 0);

    MainTask.prev = NULL;
    MainTask.next = NULL;
    MainTask.id   = tid;
    
    CurrentTask = &MainTask;
}


int task_create(task_t *task, void (*start_routine)(void *), void *arg){
    if ( !task ){
        perror("task_create: task is NULL");
        return -7;
    }

    if ( !start_routine ){
        perror("task_create: start_routine is NULL");
        return -8;    
    }
    
    if ( getcontext(&(task->context)) < 0 ){
        perror("task_create: getcontext");
        return -9;    
    }

    tid++;
    task->prev = NULL;
    task->next = NULL;
    task->id   = tid;

    char *stack = malloc(STACKSIZE) ;
    if ( stack ){
        task->context.uc_stack.ss_sp    = stack;
        task->context.uc_stack.ss_size  = STACKSIZE;
        task->context.uc_stack.ss_flags = 0;
        task->context.uc_link           = 0;
    }
    else {
        perror("task_create: malloc stack");
        return -10;    
    }

    makecontext(&(task->context), (void*)start_routine, 1, arg);

    #ifdef DEBUG
    printf("task_create: criou tarefa %d\n", task->id);
    #endif

    return task->id;
}


int task_switch(task_t *task){
    if ( !task ){
        perror("task_switch: task is NULL");
        return -7;
    }

    task_t *cTask = CurrentTask; 
    
    CurrentTask = task;

    #ifdef DEBUG
    printf("task_switch: trocando contexto %d -> %d\n", cTask->id, task->id);
    #endif

    if ( swapcontext(&(cTask->context), &(task->context)) < 0 ){
        perror("task_switch: swapcontext");
        return -11;
    }

    return 0;
}


void task_exit(int exit_code){

    #ifdef DEBUG
    task_t *cTask = CurrentTask; 

    printf("task_exit: tarefa %d sendo encerrada\n", cTask->id);
    #endif

    task_switch(&MainTask);
}


int task_id(){
    if ( !CurrentTask ){
        return 0;
    }

    return CurrentTask->id;
}
