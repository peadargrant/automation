#!/bin/bash

ansible-playbook -i inventory.ini purge_playbook.yml --ask-become-pass
