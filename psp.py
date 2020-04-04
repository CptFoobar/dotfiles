#!/usr/local/bin/python3
import argparse
import json

# <size>: {
# 	<n:num-executors>
# 	<c:executor-cores>
# 	<m:exeutor-memory> 
# }
SIZE_MAP = {
	# s: 60 v-cores, 240g memory
	's': {
		'n': 15,
		'c': 4,
		'm': 16
	},
	# m: 100 v-cores, 625g memory
	'm': {
		'n': 25,
		'c': 4,
		'm': 25
	},
	# l: 250 v-cores, 1250g memory
	'l': {
		'n': 50,
		'c': 5,
		'm': 25
	},
	# xl: 375 v-cores, 3000g memory
	'xl':  {
		'n': 75,
		'c': 5,
		'm': 40
	},
	# xxl: 1000 v-cores, 8000g memory
	'xxl':  {
		'n': 200,
		'c': 5,
		'm': 40
	},
	# insane: 1250 v-cores, 11,250g memory	
	'insane':  {
		'n': 250,
		'c': 5,
		'm': 45
	}

}

def print_sizes(_):
	for size, config in SIZE_MAP.items():
		print('{0}:\t{1} executors with {2} v-cores and {3}g memory. Total: {4} v-cores and {5}g memory.'
				.format(size, config['n'], config['c'], config['m'], config['n']*config['c'], config['n']*config['m']))

def copy_to_clipboard(cmd):
    try:
        import pyperclip
        pyperclip.copy(cmd)
    except ModuleNotFoundError as e:
        print("Module 'pyperclip' is required for copying to clipboard")

def generate_command(size, driver_memory, tags=None, name=None):
	config = SIZE_MAP[size]
	cmd = 'pyspark --master yarn --num-executors {0} --executor-cores {1} ' \
			'--executor-memory {2}g --driver-memory {3}g --conf spark.ui.port=0'.format(config['n'], config['c'], config['m'], driver_memory)
	if tags is not None:
		cmd = cmd + ' --conf spark.yarn.tags=foobar,{}'.format(tags)
	else:
		cmd = cmd + ' --conf spark.yarn.tags=foobar'
	if name is not None:
		cmd = cmd + ' --name "PySparkShell: {}"'.format(name)
	return cmd

def generate_helper(args):
	try:
		cmd = generate_command(args.size, args.driver_memory, args.tags, args.name)
		if args.clipboard:
			copy_to_clipboard(cmd)
		else:
			print(cmd)
	except Exception as e:
		import traceback
		print('An error occurred: ', e, traceback.print_tb(e.__traceback__))

def main():	
	parser = argparse.ArgumentParser(description='psp: quick util to generate pyspark launch command and copy to clipboard')
	
	subparsers = parser.add_subparsers(title='subcommands', dest='command')
	subparsers.required = True

	generator = subparsers.add_parser('gen', help='generate pyspark shell command')
	generator.add_argument('size', choices=SIZE_MAP.keys(), help='size of shell session job')
	generator.add_argument('-c', '--clipboard', default=False, action='store_true', help='copy command to clipboard (default: False)')
	generator.add_argument('-d', '--driver-memory', default=8, help='driver memory')
	generator.add_argument('-t', '--tags', help='yarn application tags')
	generator.add_argument('-n', '--name', help='application name')
	generator.set_defaults(func=generate_helper)

	helper = subparsers.add_parser('list', help='list available sizes')
	helper.set_defaults(func=print_sizes)

	args = parser.parse_args()

	args.func(args)

if __name__ == "__main__":
	main()
