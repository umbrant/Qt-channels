#include "../nbb.h"
#include <time.h>
#include <sys/stat.h>
#include <fcntl.h>

#define MSG_LEN 50
#define CLOCK_MONOTONIC 1
#define FILE_NAME "nbb_client_benchmark.log"

static const char count_str[] = "count: ";
static const char sec_str[] = "time_sec: ";
static const char nsec_str[] = "time_nsec: ";

void nbb_log(struct timespec time)
{
  static int count = 0;
  long sec = time.tv_sec;
  long nsec = time.tv_nsec;

  FILE* pFile = fopen(FILE_NAME, "w+");
  if(pFile == NULL) {
    perror("! File\n");
  }

/*
  fprintf(pFile, "%s", count_str);
  fprintf(pFile, "%d", count);

  fprintf(pFile, "%s", sec_str);
  //fprintf(pFile. "%d", sec);

  fprintf(pFile, "%s", nsec_str);
  //fprintf(pFile. "%d", nsec); 
*/

  printf("%s %d\n %s %ld\n %s %ld\n", count_str, count, sec_str, sec, nsec_str, nsec);

  count++;
  fclose(pFile); 
}

int main() 
{
  char* service_name = (char*)malloc(sizeof(char)*50);
  char* client_name = (char*)malloc(sizeof(char)*50);

	char msg[MSG_LEN] = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
  struct timespec time;

  strcpy(service_name, GUI); 
  strcpy(client_name, "Client");

	if(nbb_connect_service(client_name, service_name) < 0) {
		printf("Error getting channel!\n");
		return -1;
	}

  while(1) {
    clock_gettime(CLOCK_MONOTONIC, &time);
    nbb_send(service_name, msg, MSG_LEN); 

    nbb_log(time);
    sleep(1);
  }

  return 0;
}
