# Ansible

### Ansible tutorial on AWS techhive-devops server

- ip-address : 15.236.20.217
- user : ubuntu

to ping connection to server techhive with user ubuntu
, i.e : "the server must have your ssh public key"

when you add ansible config and overide the defaults
then you dont need to tell ansible where is the inventory file

ansible.cfg

```sh
[defaults]
INVENTORY = inventory
```

Terminal

```sh
ansible techhive  -m ping -u ubuntu
```

to get the free memory space in server
by ad-hoc commands

```sh
ansible techhive -a "free -h" -u ubuntu
```

Ansible

- `-m : for module`
- `-a : for arguments`

to run ansible playbook

```sh
ansible-playbook playbook.yml  -u ubuntu
```

ansible inventory example

```
[techhive_servers]
techive-devops-1 ansible_host=11.136.20.211  ansible_user=ubuntu
techive-devops-2 ansible_host=12.236.20.212  ansible_user=root
```

after set username of server in inventory
you can simply run the palybook as following :

```sh
ansible-playbook playbook.yml
```

you can use multi host in inventory

```sh
# Application servers
[app]
192.168.60.3
192.168.60.4

# Database server
[db]
192.168.60.5

# group of combined servers
[multi:children]
app
db

# Varaiables for combined servers
[multi:vars]
ansible_user=root
ansible_private_ke y_file=~/.ssh/private_key
```

and to run this inventory in terminal

```sh
ansible multi -i inventory -a "hostname"
```

## Configure parallelism

You can also in ansible configure paralleism for servers ( forks )
The default value for forks is 5,
which means Ansible executes a task on the first five hosts,
waits for the task to complete, and then takes the next batch of five hosts, and so on.

Once all hosts finish the task, Ansible moves to the next tasks with a batch of five hosts again.

You can increase the value of forks in ansible.cfg, enabling Ansible to execute a task on more hosts in parallel:

```sh
[defaults]
inventory = ./hosts
forks=50
```

[8 ways to speed up your Ansible playbooks](https://www.redhat.com/sysadmin/faster-ansible-playbook-execution#:~:text=Ansible%20uses%20batches%20for%20task,five%20hosts%2C%20and%20so%20on.)

use server setup module

```sh
ansible -i inventory  techhive -m setup
```

get server date

```sh
ansible -i inventory  techhive -a "date"
```

get server free memory space

```sh
ansible -i inventory  techhive -a "free -h"
```

get server storage

```sh
ansible -i inventory  techhive -a "du -h"
```

get nginx status (any service) status

```sh
ansible -i inventory  techhive -a "service nginx status"
```

### Background Tasks on ansible

```sh
ansible -i inventory techhive -b -B 3600 -P 0 -a "apt update"


# -b   : become root user
# -B   : background job
# 3600 : 3600 secs ( hour ) backgorund job for 1 hour
# -P 0 : indicate to exit out the process and keep it in background

```

ansible will give you job id to check the progress of the process

#### Check the job id of the process

```sh
ansible -i inventory techhive -b -m async_status -a "jid=<job_id>"
```

<!-- [![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger) -->

<!-- Dillinger is a cloud-enabled, mobile-ready, offline-storage compatible,
AngularJS-powered HTML5 Markdown editor.

- Type some Markdown on the left
- See HTML in the right
- ✨Magic ✨

## Features

- Import a HTML file and watch it magically convert to Markdown
- Drag and drop images (requires your Dropbox account be linked)
- Import and save files from GitHub, Dropbox, Google Drive and One Drive
- Drag and drop markdown and HTML files into Dillinger
- Export documents as Markdown, HTML and PDF -->

## Testing and Validating ansible playbooks

```
  # Ansible Testing Spectrum                 Increase Complexity
  # =========================               ======================
  # 1. ansible-playbook --syntax-check                |
  # 2. ansible-lint                                   |
  # 3. molecule test (intergration)                   |
  # 4. ansible-playbook --check (against prod)        |
  # 5. Parallel Infrastructure                        V
```

# Used to do to Develope ansible playbook

1. create a vm somewhere by vagrant or virtualbox or aws ec2 or locally
2. setup ssh to can connect to it
3. create an inventory file
4. run the playbook
5. test and validate and develope things
6. finally delete the vm

### -> Heavy Weight Process