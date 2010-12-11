#!/usr/bin/python
import sys
import getopt

# Client-side constant
READ_STR = "Timestamp from readMore currentEvent:"
CLIENT_MOUSE_STR = "Timestamp from readMore currentEvent - mouse event:"
CLIENT_KEY_STR = "Timestamp from readMore currentEvent - key event:"
RASTERIZE_STR = "Timestamp from rasterize"

# Server-side constant
SEND_STR = "log:Timestamp from sendEvent:"
SERVER_MOUSE_STR = "Timestamp from mouse event:"
SERVER_KEY_STR = "Timestamp from s:keyboard event:"

read_more = []
send_event = []
server_mouse = []
server_key = []
client_mouse = []
client_key = []

def mean(nums):
	return sum(nums)/len(nums)

def compute_stats():

	print "\n*** Mouse Latency Stats ***"

	intra = [x-y for x,y in zip(client_mouse, server_mouse)]
	avg = mean(intra)
	stddev = (mean([(x-avg)**2 for x in intra]))**0.5

	print "avg:", avg, "s" 
	print "stddev:", stddev, "s"

	print "\n*** Keyboard Latency Stats ***"

	intra = [x-y for x,y in zip(client_key, server_key)]
	avg = mean(intra)
	stddev = (mean([(x-avg)**2 for x in intra]))**0.5

	print "avg:", avg, "s" 
	print "stddev:", stddev, "s"

	print "\n*** Other Data Latency Stats ***"

	intra = [x-y for x,y in zip(read_more, send_event)]
	avg = mean(intra)
	stddev = (mean([(x-avg)**2 for x in intra]))**0.5

	print "avg:", avg, "s" 
	print "stddev:", stddev, "s"
	
	print "\n*** (Pseudo) Draw Rate Stats ***"

	inverse_intra = [(x-y)**-1 for x,y in zip(rasterize[1:], rasterize[:-1])]

	fps = mean(inverse_intra)
	stddev = (mean([(x-fps)**2 for x in inverse_intra]))**0.5
	
	print "fps:", fps
	print "stddev:", stddev

def parse(client, server):
	rasterize = [line for line in client if line.startswith(RASTERIZE_STR)]
	rasterize = [float(line.split()[-1])/(10**9) for line in rasterize]

	read_more = [line for line in client if line.startswith(READ_STR)]
	read_more = [float(line.split()[-1])/(10**9) for line in read_more]

	send_event = [line for line in server if line.startswith(SEND_STR)]
	send_event = [float(line.split()[-1])/(10**9) for line in send_event]

	server_mouse = [line for line in server if line.startswith(SERVER_MOUSE_STR)]
	server_mouse = [float(line.split()[-1])/(10**9) for line in server_mouse]

	server_key = [line for line in server if line.startswith(SERVER_KEY_STR)]
	server_key = [float(line.split()[-1])/(10**9) for line in server_key]

	client_mouse = [line for line in server if line.startswith(CLIENT_MOUSE_STR)]
	client_mouse = [float(line.split()[-1])/(10**9) for line in client_mouse]

	client_key = [line for line in server if line.startswith(CLIENT_KEY_STR)]
	client_key = [float(line.split()[-1])/(10**9) for line in client_key]

	assert(len(send_event) == len(read_more))
	assert(len(server_key) == len(client_key))
	assert(len(server_mouse) == len(client_mouse))

def usage():
	print "Usage: ./parse_more.py -c <client_file> -s <server_file>"

def main(argv):
	if(len(argv) != 4):
		usage()
		sys.exit(-1)

	try:
		opts, args = getopt.getopt(argv, "c:s:", ["--client", "--server"])

	except getopt.GetoptError:
		usage()
		sys.exit(2)

	for opt in opts:
		if opt[0] == '-c':
			client = open(opt[1]).readlines()
		else:
			server = open(opt[1]).readlines()

	parse(client, server)
	compute_stats()

if __name__ == '__main__':
	args = main(sys.argv[1:])
