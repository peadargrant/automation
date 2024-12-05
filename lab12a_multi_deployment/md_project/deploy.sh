#!/bin/bash
# Deploy the multi-OS deployment project
# Peadar Grant

ansible-playbook -i /home/administrator/target_inventory.ini deploy_playbook.yml

