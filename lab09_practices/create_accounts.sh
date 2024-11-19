#!/bin/bash

ansible-playbook -i inventory.ini user_playbook.yml --ask-become-pass
