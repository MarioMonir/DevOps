# TechHive DevOps

### Build React App Ansible Automation

1 - Install required packages: ( nginx, certbot, python3-certbot-nginx, curl, unzip )
2 - Install Node js Repo
3 - Install Node js
4 - Start Nginx Server
5 - Template project Nginx config
6 - Setup Certbot for Nginx ( ssl ceritficate for app domain )
7 - Restart Nginx Server
8 - Create app directory if not exist
9 - Pull / Clone Repo if not exist
10 - Install pm2 then UnZip build then Serve app by PM2

### Requirements

you just need to install [Ansible](https://www.ansible.com/) on your local machine

### Assumptions

The Script Assuemed that the app build on the latest build on file
build.zip ( as github actions already have a build and zip step )
as the build process is very heavy computational and should not be
done on a remote machine

#### Config before run

1 - Set inventory ips and credentials for your remote servers and pem secrets in your inventory file

```sh
[tech_hive_aws]
techhive-master-server ansible_host=13.38.10.66

[tech_hive_aws:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=./secrets/techhive-devops-master.pem
```

2 - Set your app variables in vars/vars.yml

```sh
# Project Variables
# - - - - - - - - - - -
project_name: "sal-admin"
project_port: "4000"
project_path: "/home/ubuntu/sal/"
project_domain: "{{ project_name }}.techhive.dev"
project_email: "techivedevs@gmail.com"
project_repo: "git@github.com:TechHiveDev/{{ project_name }}.git"

# NodeJs Version
# - - - - - - - - - - -
node_version: "16"
```

## Run The Ansible File

```sh
ansible-playbook main.yml
```
