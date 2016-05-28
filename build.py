#!/usr/bin/env python3

import sys
import os
import subprocess

mark = sys.argv[1]
infile = ''
for location in mark.split('/'):
	if location.endswith('.md'):
		infile = location
	else:
		os.chdir(location)

outfile = infile.replace('.md', '.html')
head = open("template.head")
tail = open("template.tail")
output = open(outfile, 'w')

output.write(head.read())
output.write(subprocess.check_output(['markdown', infile]).decode('utf-8'))
output.write(tail.read())
head.close()
tail.close()
output.close()
subprocess.call(['tidy', '-im', outfile])
