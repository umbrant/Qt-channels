#!/usr/bin/python
import sys

server = open("server.sendEvent","r").readlines()
server_nsecs = [int(x.split()[-1]) for x in server]

client = open("animated.readMore","r").readlines()
client_nsecs = [int(x.split()[-1]) for x in client]

if len(client_nsecs) != len(server_nsecs):
    print "Differing number of lines!"
    sys.exit(-1);

intra = [0]*len(client_nsecs)

intra = [x-y for x,y in zip(client_nsecs, server_nsecs)]

for x in intra:
    print x/1000000.

print "avg: ", (sum(intra)/len(intra))/1000000.
