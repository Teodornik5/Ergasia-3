#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include "header.h"

int main() {
    for (int i = 0; i < 5; i++) { 
        pid_t pid = fork();

        if (pid == 0) {
            srand(getpid()); 
            client_process();
            exit(0); 
        } else if (pid < 0) { 
            perror("Fork failed");
            exit(EXIT_FAILURE);
        }
    }

    
    for (int i = 0; i < 5; i++) {
        wait(NULL);
    }

    return 0;
}
