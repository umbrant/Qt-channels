#!/usr/bin/python
import sys
import getopt

READ_STR = "Timestamp from readMore currentEvent:"
SEND_STR = "Timestamp from QWSClient::sendEvent:"
RASTERIZE_STR = "Timestamp from QRasterPaintEnginePrivate::rasterize"

def mean(nums):
	return sum(nums)/len(nums)

def compute_stats(read_more, send_event, rasterize):
	print "\n*** Latency Stats ***"

	intra = [x-y for x,y in zip(read_more, send_event)]
	avg = mean(intra)
	stddev = (mean([(x-avg)**2 for x in intra]))**0.5

	print "avg:", avg, "s" 
	print "stddev:", stddev, "s"
	
	print "\n*** (Pseudo) Frame Rate Stats ***"

	inverse_intra = [(x-y)**-1 for x,y in zip(rasterize[1:], rasterize[:-1])]

	fps = mean(inverse_intra)
	stddev = (mean([(x-fps)**2 for x in inverse_intra]))**0.5
	
	print "fps:", fps
	print "stddev:", stddev

def parse(client, server):
	read_more = [line for line in client if line.startswith(READ_STR)]
	read_more = [float(line.split()[-1])/(10**9) for line in read_more]

	rasterize = [line for line in client if line.startswith(RASTERIZE_STR)]
	rasterize = [float(line.split()[-1])/(10**9) for line in rasterize]

	send_event = [line for line in server if line.startswith(SEND_STR)]
	send_event = [float(line.split()[-1])/(10**9) for line in send_event]

	if len(send_event) != len(read_more):
		print "! Different # of lines"
		sys.exit(-1)

	return [read_more, send_event, rasterize]

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

	read_more, send_event, rasterize = parse(client, server)
	compute_stats(read_more, send_event, rasterize)

if __name__ == '__main__':
	args = main(sys.argv[1:])
