#!/usr/bin/env python3
# Client system check script in Python for Automation Module
# Peadar Grant

from shutil import which # for testing commands
from argparse import ArgumentParser
import json
import platform
import sys

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

description = 'client system check script for automation module'
    
parser = ArgumentParser(description=description,
                        epilog='For completeness you should generally call this script using the OS-specific wrapper like system_check_windows.ps1 or system_check_linux.sh')
parser.add_argument('--input', help='input filename', default='client_requirements.json')
parser.add_argument('--wrapper', help='wrapper script system type', default=None)
args = parser.parse_args()

print(description)

# platform detection
system = platform.system()
if 'Linux' == system:
    system = 'linux'
elif 'Darwin' == system:
    system = 'mac'
elif 'Windows' == system:
    system = 'windows'
print('detected client system type is %s' % system)

if args.wrapper is not None:
    print('wrapper script type is %s' % args.wrapper)
    if args.wrapper != system:
        print(f'{bcolors.WARNING}re-try with correct wrapper script for system type %s{bcolors.ENDC}' % system)
        sys.exit(1)

f = open(args.input, 'r')
input_data = json.load(f)
f.close()

commands = input_data['commands']

warnings = 0
errors = 0

for command in commands.keys():
    r = commands[command]

    if not r.get('enabled', True):
        continue
    
    print(f'checking for {bcolors.BOLD}%s{bcolors.ENDC} ... ' % command, end='')
    
    if which(command) is None:
        if "compulsory" in r and False == r['compulsory']:
            print(f'{bcolors.WARNING}not found [advisory]{bcolors.ENDC}')
            warnings = warnings + 1 
        else:
            print(f'{bcolors.FAIL}not found{bcolors.ENDC}')
            errors = errors + 1
        if "links" in r and system in r["links"]:
            print('  install from: %s' % r['links'][system])
        if "guidance" in r and system in r['guidance']:
            print('  %s' % r['guidance'][system])
        continue

    print(f'{bcolors.OKGREEN}ok{bcolors.ENDC}')

print("%3d errors" % errors)
print("%3d warnings" % warnings)

if errors > 0:
    print('fix the errors identified and re-run this script to confirm')
else:
    print(f'{bcolors.OKGREEN}your client system meets the requirements for this module.{bcolors.ENDC}')
