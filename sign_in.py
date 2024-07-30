#!/usr/bin/env python3
# Sign-in script for in-class attendance tracking in automation module
# Peadar Grant

from argparse import ArgumentParser

parser = ArgumentParser()
args = parser.parse_args()

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


print(f'{bcolors.FAIL}automated attendance tracking not working yet{bcolors.ENDC}')

