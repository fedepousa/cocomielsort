#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#define NUM_THREADS	3


typedef struct {
  char	buf[1];
  pthread_mutex_t	lock;
  pthread_cond_t	less;
  pthread_cond_t	more;
  int	nextin;
  int   nextout;
  int   ocuppied;
} buffer_t;

void *consumer(void *);
void *producer(void *);
char consume(buffer_t *);
void produce(buffer_t *, char);


int main(int argc, char *argv[]){
	buffer_t buff;
	buffer_t *buffer=&buff;
	pthread_mutexattr_t mutex_attr;
	pthread_condattr_t cond_attr;
	buffer->ocuppied=0;
	buffer->nextin=0;
	buffer->nextout = 0;

	pthread_mutexattr_init(&mutex_attr);
	pthread_mutexattr_setpshared(&mutex_attr,	PTHREAD_PROCESS_SHARED);
	pthread_mutex_init(&buffer->lock, &mutex_attr);
	pthread_condattr_init(&cond_attr);
	pthread_condattr_setpshared(&cond_attr, PTHREAD_PROCESS_SHARED);
	pthread_cond_init(&buffer->less, &cond_attr);
	pthread_cond_init(&buffer->more, &cond_attr);

	
	pthread_t threads[2];
	pthread_create(&threads[1], NULL,producer,(buffer));
	pthread_create(&threads[0], NULL,consumer,(buffer));
	pthread_join(threads[1], NULL); 

}


void *consumer(void * b){
    char item;
  
	//primera vez
    
    //quiero consumir
    item = consume((buffer_t *)b);  
    printf("Consumi: ");
    putchar(item);
    putchar('\n');
    
    //segunda vez quiero consumir
    item = consume((buffer_t *)b);  
    printf("Consumi:");
    putchar(item);
    putchar('\n');
    

}

void *producer(void * b) {
    int item;
	
	char letra = 'a';
	produce((buffer_t *)b, letra);
	printf(" Produje letra a \n");
	
	letra = 'b';
	produce((buffer_t *)b, letra);
	printf("Produje letra b \n");
	
	
}

char consume(buffer_t * b){

    pthread_mutex_lock(&b->lock);
    char item;
  //  printf("Consume\n");
	while (b->ocuppied <= 0){
		pthread_cond_wait(&b->more, &b->lock);
    }
    
//	printf("Consumidor consume %c \n", item);
	item = b->buf[0];
    b->nextout =0;
    b->ocuppied=0;
    pthread_cond_signal(&b->less);
    pthread_mutex_unlock(&b->lock);
    return (item);
}

void produce(buffer_t * b, char item){
    pthread_mutex_lock(&b->lock);
    while (b->ocuppied > 0){
        pthread_cond_wait(&b->less, &b->lock);
    } 
    printf(" Estoy produciendo %c \n",item);
    printf(" el valor de ocuppied es ");
    printf("%d",b->ocuppied);
    putchar('\n');
	b->buf[0]=item;
    b->nextin = 0 ;
    
    b->ocuppied=1;
    
    pthread_cond_signal(&b->more);
    pthread_mutex_unlock(&b->lock);
}


