#!/bin/bash
sudo apt update
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# Hands on
cat <<EOF >> /etc/ansible/hosts
local_server ansible_host=127.0.0.1 ansible_connection=local
EOF
ansible -m ping all