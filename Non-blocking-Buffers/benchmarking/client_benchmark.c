#include "../nbb.h"

#include <time.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#define CLOCK_MONOTONIC 1
#define FILE_NAME "nbb_client_benchmark.log"

static const char count_str[] = "count: ";
static const char sec_str[] = "time_sec: ";
static const char nsec_str[] = "time_nsec: ";

void usage()
{
	printf("./client_benchmark -l <message length>\n");
	return;
}

int main(int argc, char** argv) 
{
	int length;
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

  char* service_name = (char*)malloc(sizeof(char)* (strlen(NBB_GUI)+1));
  char* client_name = (char*)malloc(sizeof(char) * (strlen("Client")+1));
	char msg[length];

	int i;
	for(i=0;i<length;i++) {
		msg[i] = 'a';
	}

  struct timespec time;

  strcpy(service_name, NBB_GUI); 
  strcpy(client_name, "Client");

	if(nbb_connect_service(client_name, service_name) < 0) {
		printf("Error getting channel!\n");
		return -1;
	}

	nbb_print_timestamp("Client");

	for(i=0;i<30;i++) {
    nbb_send(service_name, msg, length); 
  }

  return 0;
}
