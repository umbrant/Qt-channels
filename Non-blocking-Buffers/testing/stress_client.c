#include "../nbb.h"
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[]) 
{
    char* service_name = "stress_service";
    char* client_name = "stress_client";
    char* msg;
    int msg_size;
    int times;
    int i;

    if (argc != 3) {
        fprintf(stderr, "Usage: %s N MSG_SIZE\n", argv[0]);
        exit(-1);
    }

    times = atoi(argv[1]);
    msg_size = atoi(argv[2]);

    assert(msg_size >= 0);
    assert(times >= 0);

    msg = malloc(msg_size);
    assert(msg != NULL);
    memset(msg, 'A', msg_size);

	  if(nbb_connect_service(client_name, service_name) < 0) {
		    printf("Error getting channel!\n");
		    return -1;
	  }

    printf("***Sending '%.*s' to '%s' %d times...\n",
        msg_size, msg, service_name, times);

    for (i = 0; i < times; i++) {
        nbb_send(service_name, msg, msg_size);
    }

    sleep(10);

    return 0;
}
