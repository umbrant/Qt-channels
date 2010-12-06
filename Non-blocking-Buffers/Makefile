CFLAGS=-Wall -g -ggdb
LIBS=-L. -lnbb -lrt -lnameserver
CC=gcc

all: nameserver_main
	rm -rf *.o

nameserver_main: libnbb.a libnameserver.a nameserver_main.c
	$(CC) $(CFLAGS) nameserver_main.c -o nameserver $(LIBS)

debug: service client nameserver_main stress_service stress_client
  CFLAGS=-Wall -g -ggdb -DDEBUG

# shared library
libnbb.so.1.0.1: nbb.c
	$(CC) $(CFLAGS) -c -fPIC nbb.c
	$(CC) -shared -Wl,-soname,libnbb.so.1 -o libnbb.so.1.0.1 nbb.o

libnameserver.so.1.0.1: nameserver.c
	$(CC) $(CFLAGS) -c -fPIC nameserver.c
	$(CC) -shared -Wl,-soname,libnameserver.so.1 -o libnameserver.so.1.0.1 nameserver.o

# static library
libnbb.a: nbb.o
	ar rcs libnbb.a nbb.o

libnameserver.a: nameserver.o 
	ar rcs libnameserver.a nameserver.o

nbb.o: nbb.c nbb.h
	$(CC) $(CFLAGS) -c -fPIC nbb.c -S -o nbb.s
	sed -i "s/__sysv_signal/signal/" nbb.s
	$(CC) $(CFLAGS) -c -fPIC nbb.s

nameserver.o: nameserver.c nameserver.h 
	$(CC) $(CFLAGS) -c nameserver.c

clean:
	rm -rf *.o nbb_multi libnbb.so.1.0.1 *.a client nameserver service
