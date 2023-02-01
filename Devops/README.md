# TechHive DevOps

## [Ansible](https://www.ansible.com/)

##### requirements : you just need to install ansible on your machine

To run Ansible

```sh
ansible-playbook main.yml
```

you may need to take a look inside the yaml file to check variables
of where you need to store database in your machine and on your
remote machine

| Case | Command |
| ------ | ------ |
| Backup All Test Server Databases  | `> Ansible/Backup Test Databases  ansible-playbook backup_all_test_servers.yml` |
| Backup All Live Server Databases  | `> Ansible/Backup Live Databases  ansible-playbook backup_all_live_servers.yml` |
