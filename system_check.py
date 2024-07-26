#!/usr/bin/env python3
# System check script in Python for Automation Module
# Peadar Grant

from shutil import which # for testing commands
from argparse import ArgumentParser
import json
import platform

parser = ArgumentParser(description='system check script for automation module',
                        epilog='For completeness you should generally call this script using the OS-specific wrapper like system_check_windows.ps1 or system_check_linux.sh')
parser.add_argument('--input', help='input filename', default='requirements.json')
args = parser.parse_args()

# platform detection
system = platform.system()
if 'Linux' == system:
    system = 'linux'
elif 'Darwin' == system:
    system = 'mac'
elif 'Windows' == system:
    system = 'windows'
print('detected system type is %s' % system)

f = open(args.input, 'r')
input_data = json.load(f)
f.close()

commands = input_data['commands']

for command in commands.keys():
    r = commands[command]
    print('checking for %s ... ' % command, end='')
    
    if which(command) is None:
        print('not found')
        continue

    print('ok')
