	#include <stdio.h>
	#include <stdlib.h>
	#include <sys/wait.h>

	int main()
	{
		int pipefd[2];
		pid_t cpid;
		char buf = 'a';
	
		if(pipe(pipefd)== -1) {
			perror("pipe");
			exit(EXIT_FAILURE);
		}


		cpid = fork();
		if (cpid == -1){
			perror("fork");
			exit(EXIT_FAILURE);
		}


		if (cpid == 0){//el hijo lee
			close(pipefd[1]); //cierro la escritura
			read(pipefd[0], &buf, 1);
			printf("Hijo: me ejecuto mientras el otro no\n");
			close(pipefd[0]);
			exit(EXIT_SUCCESS);

		}else {// el padre escribe y luego espera
			close(pipefd[0]);
			printf("Padre: me ejecuto solo\n");
			write(pipefd[1], &buf, 1);
			close(pipefd[1]);
			wait(NULL); //espero a que cambie el estado (termine el hijo)
			exit(EXIT_SUCCESS);
		}

	}
