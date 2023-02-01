#!/bin/bash

echo "backup test servers at $(date) ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
cd /home/ubuntu/DevOps/Ansible/Backup-test-databases/
ansible-playbook backup_all_test_servers.yml

echo "backup live servers at $(date) ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ "
cd /home/ubuntu/DevOps/Ansible/Backup-live-databases/
ansible-playbook backup_all_live_servers.yml


echo "Delete All Sql Files (backups) more than 6 Days"
find /home/ubuntu/backups/ -name  "*.sql" -mtime +6  -exec rm -f {} \; 
