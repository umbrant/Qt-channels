#include "nbb.h"

#include <stdio.h>
#include <unistd.h>

#define NUM_CHANNELS 5 

static int new_data[NUM_CHANNELS];
static int new_conn[NUM_CHANNELS];
static int has_new_data = 0;
static int has_new_conn = 0;

static const int buffer_size = 1<<20;
static char buffer[1<<20];

static void on_new_data(int slot_id)
{
    new_data[slot_id] = 1;
    has_new_data = 1;
}

static void on_new_connection(int slot_id, void *arg)
{
    new_conn[slot_id] = 1;
    has_new_conn = 1;
}

static void process_data(int slot_id)
{
    int ret = nbb_read_bytes(slot_id, buffer, buffer_size);
    printf("***Got %d bytes from slot %d\n", ret, slot_id);

    write(fileno(stderr), buffer, ret);
}

int main() 
{
    char* service_name = "stress_service";
    int i;

  	if(nbb_init_service(NUM_CHANNELS, service_name)) {
	    	printf("Error initializing as service, failing!\n");
	    	return -1;
	  }

    nbb_set_cb_new_connection(service_name, on_new_connection, NULL);
    nbb_set_cb_new_data(service_name, on_new_data);

    while(1) {
        sleep(1);

        if (has_new_conn) {
            for (i = 1; i < NUM_CHANNELS; i++) {
                if (new_conn[i]) {
                    printf("Got new connection from slot %d\n", i);
                    new_conn[i] = 0;
                }
            }
        }

        if (has_new_data) {
            for (i = 0; i < NUM_CHANNELS; i++) {
                if (new_data[i]) {
                    process_data(i);
                    new_data[i] = 0;
                }
            }
        }

        has_new_data = 0;
        has_new_conn = 0;
    }
}
