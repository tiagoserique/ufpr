// GRR20195138 Tiago Serique Valadares
// PingPongOS - PingPong Operating System
// Prof. Carlos A. Maziero, DINF UFPR
// Versão 1.4 -- Janeiro de 2022

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/time.h>
#include <string.h>
#include "ppos.h"
#include "queue.h"
#include "disk.h"
#include "ppos_disk.h"


// headers =====================================================================

// the handler for the SIGUSR1 signal
void signal_disk_handler();

// create a new request for the disk driver
disk_request_t *create_request(int block, void *buffer, int operation);

// global variables ============================================================

// the task that will be the disk driver
task_t diskDriverTask;

// the disk
disk_t disk;

// the action for the SIGUSR1 signal
struct sigaction actionDisk;

// functions ===================================================================

void diskDriverBody(void * args){
    disk_request_t *request;

    while ( TRUE ){
        sem_down(&disk.access);

        // if the request was acceded, then remove the task from the waiting 
        // queue and remove the request from the queue and free it
        if ( disk.sinal == TRUE ){
            task_resume((task_t *) request->task, (task_t **) &disk.waiting_queue);
            queue_remove((queue_t **) &disk.request_queue, (queue_t *) request);

            free(request);
            disk.sinal = FALSE;
        }


        int disk_status = disk_cmd(DISK_CMD_STATUS, 0, 0);


        // if the disk is not busy, then get the next request from the queue
        if ( disk_status == DISK_STATUS_IDLE && disk.request_queue ){
            request = disk.request_queue;

            disk_cmd(request->operation, request->block, request->buffer);
        }


        // if there is no request in the queue, then the disk is idle
        if ( !disk.request_queue && !disk.waiting_queue ){
            queue_remove((queue_t **) &readyQueue, (queue_t *) &diskDriverTask);

            diskDriverTask.status = TASK_SUSPENDED;
        }
        else diskDriverTask.status = TASK_READY;

        sem_up(&disk.access);

        task_yield();
    }
}


int disk_mgr_init(int *numBlocks, int *blockSize){

    // register the SIGALRM signal handler
    actionDisk.sa_handler = signal_disk_handler;
    sigemptyset(&actionDisk.sa_mask);
    actionDisk.sa_flags = 0 ;
    if ( sigaction(SIGUSR1, &actionDisk, 0) < 0 ){
        perror("Erro em sigaction: ");
        exit(1);
    }

    if ( disk_cmd(DISK_CMD_INIT, 0, 0) ) return -1;


    sem_create(&disk.access, 1);
    sem_down(&disk.access);

    disk.request_queue = NULL;
    disk.waiting_queue = NULL;
    disk.sinal = FALSE;

    isUserTask = FALSE;
    task_create(&diskDriverTask, diskDriverBody, NULL);
    isUserTask = TRUE;

    diskDriverTask.status = TASK_SUSPENDED;
    
    *numBlocks = disk_cmd(DISK_CMD_DISKSIZE, 0, 0);
    *blockSize = disk_cmd(DISK_CMD_BLOCKSIZE, 0, 0);

    if ( *numBlocks < 0 || *blockSize < 0 ) return -1;

    sem_up(&disk.access);


    #ifdef DEBUG
    printf("disk_mgr_init: inicia disco com numBlock = %d e blockSize = %d\n", *numBlocks, *blockSize);
    printf("\n");
    #endif


    return 0;
}


int disk_block_read(int block, void *buffer){
    if ( block < 0 || !buffer ) return -1;

    sem_down(&disk.access);
 
    disk_request_t *request = create_request(block, buffer, DISK_CMD_READ);
    queue_append((queue_t **) &disk.request_queue, (queue_t *) request);

    if ( diskDriverTask.status == TASK_SUSPENDED ){
        task_resume((task_t *) &diskDriverTask, NULL);
    }

    sem_up(&disk.access);


    #ifdef DEBUG
    queue_print("disk_block_read: waiting queue", (queue_t *) disk.waiting_queue,
     (void *) print_queue);
    printf("\n");
    #endif


    task_suspend((task_t **) &disk.waiting_queue);

    return 0;
}


int disk_block_write(int block, void *buffer){
    if ( block < 0 || !buffer ) return -1;

    sem_down(&disk.access);
 
    disk_request_t *request = create_request(block, buffer, DISK_CMD_WRITE);
    queue_append((queue_t **) &disk.request_queue, (queue_t *) request);

    if ( diskDriverTask.status == TASK_SUSPENDED ){
        task_resume((task_t *) &diskDriverTask, NULL);
    }

    sem_up(&disk.access);


    #ifdef DEBUG
    queue_print("disk_block_write: waiting queue", (queue_t *) disk.waiting_queue,
     (void *) print_queue);
    printf("\n");
    #endif


    task_suspend((task_t **) &disk.waiting_queue);

    return 0;
}


disk_request_t *create_request(int block, void *buffer, int operation){
    disk_request_t *request = (disk_request_t *) malloc(sizeof(disk_request_t));
    
    if ( !request ) exit(-1);

    request->prev = NULL;
    request->next = NULL;
    request->task = currentTask;
    request->operation = operation;
    request->block = block;
    request->buffer = buffer;

    return request;
}


void signal_disk_handler(){
    if ( diskDriverTask.status == TASK_SUSPENDED ){
        task_resume((task_t *) &diskDriverTask, NULL);
    }

    disk.sinal = TRUE;
}
