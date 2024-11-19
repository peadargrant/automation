#!/bin/bash

ansible-playbook -i inventory.ini lab_playbook.yml --ask-become-pass
