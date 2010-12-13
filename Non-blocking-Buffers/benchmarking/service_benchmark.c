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

void on_new_connection(int slot_id, void *arg)
{
  printf("GUI got new connection on slot %d\n", slot_id);
}

void nbb_log(int slot_id)
{
	nbb_print_timestamp("New data");
}

int main() 
{
  char* service_name = (char*)malloc(sizeof(char)*(strlen(NBB_GUI) + 1));
  strcpy(service_name, NBB_GUI);

	if(nbb_init_service(NUM_CHANNELS, service_name)) {
		printf("Error initializing as service, failing!\n");
		return -1;
	}

  sleep(1);

  nbb_set_cb_new_connection(service_name, on_new_connection, NULL);
  nbb_set_cb_new_data(service_name, nbb_log);

  while(1);
}
