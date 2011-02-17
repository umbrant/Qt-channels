#include "../nbb.h"

#include <time.h>
#include <sys/stat.h>
#include <fcntl.h>

#define NUM_CHANNELS 5 
#define CLOCK_MONOTONIC 1
#define FILE_NAME "nbb_service_benchmark.log"

static const char count_str[] = "count: ";
static const char sec_str[] = "time_sec: ";
static const char nsec_str[] = "time_nsec: ";
static char array[1024];

static int i=0;
int length;

void on_new_connection(int slot_id, void *arg)
{
    printf("GUI got new connection on slot %d\n", slot_id);
}

void nbb_log(int slot_id)
{
    while(nbb_bytes_available(slot_id)) {
	    int size = nbb_read_bytes(slot_id, array, length);
	    if(size) {
	        i++;
	    }
	}
	//printf("size: %d, array: %s\n",size, array);
}


void usage()
{
	printf("./service_benchmark -l <message length>\n");
	return;
}

int main(int argc, char** argv) 
{
	int opt;

	if (argc != 3) {
		usage();
		return 1;
	}

	while((opt = getopt(argc, argv, "l:")) != -1) {
		switch (opt) {
			case 'l':
				length = atoi(optarg);
				break;
			default:
				usage();
				return 1;
		}
	}

    char* service_name = (char*)malloc(sizeof(char)*(strlen(NBB_GUI) + 1));
    strcpy(service_name, NBB_GUI);

	if(nbb_init_service(NUM_CHANNELS, service_name)) {
		printf("Error initializing as service, failing!\n");
		return -1;
	}

    sleep(1);

    nbb_set_cb_new_connection(service_name, on_new_connection, NULL);
    nbb_set_cb_new_data(service_name, nbb_log);

    int size = (1<<20) * 10;
    int num = size / length;

    while(1) {
		if(i>=10000) break;
    }
	nbb_print_timestamp("Server");
}
