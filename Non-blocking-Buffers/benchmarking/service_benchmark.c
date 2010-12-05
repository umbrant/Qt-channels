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

static void on_new_connection(int slot_id, void *arg)
{
  printf("GUI got new connection on slot %d\n", slot_id);
}

static void nbb_log(int slot_id)
{
  static int count = 0;
  static struct timespec time;

  clock_gettime(CLOCK_MONOTONIC, &time);
  FILE* pFile = fopen(FILE_NAME, "w+");

  if(pFile == NULL) {
    perror("! File\n");
  }

  fprintf(pFile, "%s", count_str);
  fprintf(pFile, "%d", count);
 
  fprintf(pFile, "%s", sec_str);
  //fprintf(pFile. "%d", sec);
 
  fprintf(pFile, "%s", nsec_str);
  //fprintf(pFile. "%d", nsec); 

  printf("%s %d\n %s %ld\n %s %ld \n", count_str, count, sec_str, time.tv_sec, nsec_str, time.tv_nsec);

  count++;
  fclose(pFile);
}

int main() 
{
  char* service_name = (char*)malloc(sizeof(char)*(strlen(GUI) + 1));
  strcpy(service_name, GUI);

	if(nbb_init_service(NUM_CHANNELS, service_name)) {
		printf("Error initializing as service, failing!\n");
		return -1;
	}

  sleep(1);

  nbb_set_cb_new_connection(service_name, on_new_connection, NULL);
  nbb_set_cb_new_data(service_name, nbb_log);

  while(1);
}
