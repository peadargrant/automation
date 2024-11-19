#!/bin/bash

ansible-playbook -i control_inventory.ini control_playbook.yml --ask-become-pass
