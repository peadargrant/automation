#!/bin/bash
# Target server setup

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install ngircd
sudo apt -y install irssi
echo 'auto setup done' 
echo 'auto setup done' > results.txt
