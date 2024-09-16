#!/usr/bin/env python3
# Lab folder setup script
# Peadar Grant

from argparse import ArgumentParser
import getpass

parser = ArgumentParser(description='lab folder setup script')
parser.add_argument('--output', help='output file name', default='README.md')
parser.add_argument('programme', help='programme', choices=['cso','hdip']) 
args = parser.parse_args()

username = getpass.getuser()

print('detected username: %s' % username)
username = username.upper()

import re
while not re.match(r'^D\d\d\d\d\d\d\d\d$', username):
    username = input('Enter D number: ').upper()

print('username is in correct pattern for dkit')

if args.programme is None:
    print('Must specify programme on the command line')
    print('Use -h switch to see command line options.')

print('selected programme: %s' % args.programme)

print('output filename is %s' % args.output )

f = open(args.output, 'w')
f.write("# Automation labs\n\n**Student ID:** %s\n\n**Course:** %s\n\n" % ( username, args.programme, ))
f.close()

print('wrote %s' % args.output )
