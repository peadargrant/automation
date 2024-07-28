#!/usr/bin/env python3
# Lab folder setup script
# Peadar Grant

from argparse import ArgumentParser
import getpass

parser = ArgumentParser(description='lab folder setup script')
parser.add_argument('--output', help='output file name')
parser.add_argument('programme', help='programme', choices=['l8','hdip']) 
args = parser.parse_args()

username = getpass.getuser()

print('detected username: %s' % username)
username = username.upper()

import re
while not re.match(r'^D\d\d\d\d\d\d\d\d$', username):
    username = input('Enter D number: ').upper()

print('username is in correct pattern for dkit')

print('selected programme: %s' % args.programme)

output_filename = 'README.md'
if args.output is not None:
    output_filename = args.output
print('output filename is %s' % output_filename )

f = open('README.md', 'w')
f.write("# Automation labs\n\n**Student ID:** %s\n\n**Course:** %s\n\n" % ( username, args.programme, ))
f.close()

print('wrote %s' % output_filename )
