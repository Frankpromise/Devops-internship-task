# TASK5_ ANSIBLE

## Tasks:
1. Deploy three virtual machines in the Cloud. 
2. Install Ansible on one of them (control_plane).


<img width="762" alt="image" src="https://user-images.githubusercontent.com/107506005/176917444-098661cd-2dc6-4f90-b3f1-e95407fe862e.png">

#### to install ansible on the control plane (script contained in script.sh)

```
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```


##### 3. Ping pong - execute the built-in ansible ping command. Ping the other two machines.

a. first, i set up a file caled  inventory to group the 2 machines
b. next i configured an ansible.cfg file to disable ssh key checking on my key then ran the following command

```
ansible -i inventory -m ping all
```

<img width="775" alt="image" src="https://user-images.githubusercontent.com/107506005/176918605-bbceb5f0-9a88-4336-9a38-9c0e8002c044.png">

### 3. My First Playbook: write a playbook for installing Docker on two machines and run it.

To do this, i created a yaml file to install docker on both webservers and also run the hello-world container from the docker hello-world image.
#### playbook contained in docker.yml

       
```
---
- hosts: all
  become: true

  tasks:
    - name: Install aptitude
      apt: name=aptitude state=latest update_cache=yes force_apt_get=yes

    - name: Install system packages
      apt: name={{ item }} state=latest update_cache=yes
      loop: [ 'apt-transport-https', 'ca-certificates', 'curl', 'software-properties-common', 'python3-pip', 'virtualenv', 'python3-setuptools']

    - name: Docker GPG apt Key Adding
      apt_key:
        url: https://download.docker.com/linux/ubuntu/gpg
        state: present

    - name: Adding Docker Repo
      apt_repository:
        repo: deb https://download.docker.com/linux/ubuntu bionic stable


    - name: Update apt and install docker-ce
      apt: update_cache=yes name=docker-ce state=latest

    - name: Install Docker Module for Python
      pip:
        name: docker

    - name: Pull hello world image
      docker_image:
        name: hello-world
        source: pull

    - name: Create Hello World container
      docker_container:
        name: hello-world
        image: hello-world
        state: started
        ports:
        - "80:80" 

```

To run the playbook, used the following command:

```
ansible-playbook -i docker.yaml --syntax-check
ansible-playbook -i inventory  docker.yaml
```



<img width="874" alt="image" src="https://user-images.githubusercontent.com/107506005/176922192-6bc847fa-3fb2-46a4-a131-3e0cbe1d6f8a.png">

### EXTRA 1. Write a playbook for installing Docker and one of the (LAMP/LEMP stack, Wordpress, ELK, MEAN - GALAXY do not use) in Docker.

##### contained in wordpress.yml

```
---
- hosts: all
  become: true
  vars_prompt:

    - name: wp_db_name
      prompt: Enter the DB name

    - name: db_user
      prompt: Enter the DB username
    
    - name: db_password
      prompt: Enter the DB password

vars:
    db_host: db
    wp_name: wordpress
    docker_network: wordpress_net
    #wp_host_port: "{{ lookup('env','WORDPRESS_PORT') | default(8080)}}"
    wp_container_port: 80

tasks:

    - name: "Create a network"
      docker_network:
        name: "{{ docker_network }}"

    - name: Pull wordpress image
      docker_image:
        name: wordpress
        source: pull

    - name: Pull MySQL image
      docker_image:
        name: mysql:5.7
        source: pull    


    - name: Create DB container
      docker_container:
        name: "{{ db_host }}"
        image: mysql:5.7
        state: started
        # ports:
        #   - "3306"
        network_mode: "{{ docker_network }}"
        env:
        MYSQL_USER: "{{ db_user }}"
        MYSQL_PASSWORD: "{{ db_password }}"
        MYSQL_DATABASE: "{{ wp_db_name }}"
        MYSQL_RANDOM_ROOT_PASSWORD: '1'
        volumes:
        - db:/var/lib/mysql:rw
        restart_policy: always


    - name: Create Wordpress container
      docker_container:
        name: "{{ wp_name }}"
        image: wordpress:latest
        state: started
        ports:
        - "80:80" 
        restart_policy: always
        network_mode: "{{ docker_network }}"
        env:
        WORDPRESS_DB_HOST: "{{ db_host }}:3306"
        WORDPRESS_DB_USER: "{{ db_user }}"
        WORDPRESS_DB_PASSWORD: "{{ db_password }}"
        WORDPRESS_DB_NAME: "{{ wp_db_name }}"
        volumes:
        - wordpress:/var/www/html
```


## EXTRA 2. Playbooks should not have default creds to databases and/or admin panel.

<img width="716" alt="image" src="https://user-images.githubusercontent.com/107506005/176940658-26070234-53e2-49e4-bbf9-b55c713fc9eb.png">


## EXTRA 3. For the execution of playbooks, dynamic inventory must be used (GALAXY can be used).

For this task, since the ansible documentation recommends pluggins for dynamic inventories over scripts, i will be using aws pluggins for this

1. I created an IAM user to get a secret access id and secret access key.
2. Next, i created an IAM role and gave it ec2 access, then i attached the role to my control plane
3. Created a new file called __aws_ec2.yml

```
---
plugin: aws_ec2
aws_access_key: <secret_access_key>
aws_secret_key: < secret_key>
keyed_groups:
  - key: tags
    prefix: tag
```
3. I ran the following command on it:

```
ansible-inventory -i <Path to file>
```
3. Next, i created a new file and stored the following configuration

```
---
plugin: aws_ec2
aws_access_key: <access_id>
aws_secret_key: <access_key>
keyed_groups:
  - key: tags
    prefix: tag
  - prefix: instance_type
  - key: placement.region
    prefix: aws_region
```

```
ansible-inventory - aws_ec2.yml --list
```

<img width="833" alt="image" src="https://user-images.githubusercontent.com/107506005/176974006-697ed8be-bb7e-4d90-bba1-f598f0b16764.png">

```
ansible all -m ping
```
<img width="854" alt="image" src="https://user-images.githubusercontent.com/107506005/176990599-dd7f7e0a-3337-4d71-8f14-7fdb1d2730af.png">

```
ansible-inventory --graph
```

<img width="818" alt="image" src="https://user-images.githubusercontent.com/107506005/176990626-60b81d7a-20dc-4390-b928-bb35457fa527.png">


## ALL TASK COMPLETED
