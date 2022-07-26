# Devops-internship-task


# Exadel-Tasks


## [Task 1: Git/GitHub](Task1) 
Additional information:
1.	Read about Git https://git-scm.com/doc
 
Tasks:

0. Create a Github account(if you don’t have one).
1.	Create new Github repository.
2.	Create Task1 folder in the master branch. Create and push ./Task1/README.md file.
3.	Create new branch dev. Create and push any test file.
4.	Create new branch %USERNAME-new_feature.
5.	Add README.md file to your %USERNAME-new_feature branch
6.	Check your repo with git status command
7.	Add .gitignore file to ignore all files whose name begins “.”
8.	Commit and push changes to github repo.
9.	Create Pull Request to the dev branch.
10.	Merge your branch with the dev branch and create Pull Request to the master branch. Merge dev with master.
11.	Checkout to %USERNAME-new_feature, make changes in README.md and commit them. Revert last commit in %USERNAME-new_feature branch.
12.	Check your repo with git log command, create log.txt file in master branch and save “git log” output in it.
13.	Delete local and remote branch %USERNAME-new_feature.
14.	 Add all used command to the git_commands.md file in the dev branch.
15.	 Send the link to your Git Repository to your mentor via private Skype message.




## [Task 2: AWS Cloud](Task2)
(Note. The assignment is written using AWS as an example. You can complete the assignment using any cloud services.)

Before completing this task, it is recommend check this video:
 https://www.youtube.com/watch?v=O1_--7IvP5g&list=PLg5SS_4L6LYsxrZ_4xE_U95AtGsIB96k9 (RU)


Important moments:
1.	Read about Cloud Services. Pro and Cons Cloud VS Bare Metal infrastructure?
2.	Read about Region, Zone in AWS. What are they for, which one will you use?
3.	Read about AWS EC2, what is it, what is it useful for?
4.	Read about AWS VPC (SG, Route, Internet Gateway).
5.	If you sign up in AWS for the first time, you will have the opportunity to use SOME AWS services for free (free tier) for 1 year. To register, you need a credit card from which it will be debited and returned 1-2$.
6.	Read about AWS Free Tier. There should be a clear of what will be free for new users and what will have to be paid for your own money.

Tasks:
1.	Sign up for AWS, familiarize yourself with the basic elements of the AWS Home Console GUI.
2.	Explore AWS Billing for checking current costs. 
3.	Create two EC2 Instance t2.micro with different operating systems (Amazon linux / Ubuntu ...). Try to stop them, restart, delete, recreate.
4.	Make sure there is an SSH connection from your host to the created EC2. What IP EC2 used for it?
5.	Make sure is an ping and SSH passed from one instance to another and vice versa. Configure SSH connectivity between instances using SSH keys.
6.	Install web server (nginx/apache) to one instance; 
- Create web page with text “Hello World” and information about OS version;
- Make sure web server accessible from internet and you can see your web page “Hello World” in your browser; 
- Make sure in instance without nginx/apache you can see “Hello world” from instance with nginx/apache.

 

EXTRA: 
1.	Run steps 3-6 with instances created in different VPC. (connectivity must be both external and internal IP)	
2.	Write BASH script for installing web server (nginx/apache) and creating web pages with text “Hello World”, and information about OS version
3.	Run step.6 without “manual” EC2 SSH connection.

The result of this task is a link in your github to the “Hello World” web page on AWS. After checking task by the mentor, the instance may be deleted. EXTRA tasks are passed to mentors individually. 





## [Task 3: Terraform/IaC introduction](Task3)
(Note. The assignment is written using AWS as an example. You can complete the assignment using any cloud services.)

Important moments:
1.	Read about IaC (Infrastructure as a Сode)
2.	All steps are done using Terraform , if you need any other tools besides WEB GUI, you can use them. 
3.	You should not use the previously created VPC/EC2, etc. We assume that the task is executed from a “clear” AWS account with only the IAM administrator role. 
4.	Passwords/Keys should not be stored on GitHub.

Tasks:
1.	Create EC2 Instance t2.micro
-	Ubuntu
-	CentOS
Both instances must have a tag with names. 
2.	EC2 Ubuntu must have Internet access, there must be incoming access: ICMP, TCP/22, 80, 443, and any outgoing access. 
3.	EC2 CentOS should not have access to the Internet, but must have outgoing and incoming access: ICMP, TCP/22, 80, 443 only on the local network where EC2 Ubuntu, EC2 CentOS is located. 
4.	On EC2 Ubuntu, install a web server (nginx/apache);
- Create a web page with the text “Hello World” and information about the current version of the operating system. This page must be visible from the Internet. 
5.	On EC2 Ubuntu install Docker, installation should be done according to the recommendation of the official Docker manuals 

EXTRA:
6.	Complete  step 1, but AMI ID cannot be hardcoded. You can hardcode operation system name, version, etc. 
7.	Step 3 read as: 
EC2 CentOS should have outgoing and incoming access: ICMP, TCP/22, 80, 443, only to EC2 Ubuntu. 
8.	On EC2 CentOS install nginx (note. Remember about step 7, the task can be done in any way, it is not necessary to use terraform)
- Create a web page with the text “Hello World” and information about the current version of the operating system. This page must be visible from the  EC2 Ubuntu.

The result of steps.1-7. is a terraform files in your GitHub. +file with output terraform plan BEFORE creating infrastructure.
The result of step EXTRA 8, is or scripts (if you have one), or an explanation of how this can be implemented.



## [Task 4: Docker](Task4)

Docs:
1.	Read documentation about docker (https://docs.docker.com/)

Tasks:
1.	Install docker. (Hint: please use VMs or Clouds  for this.)
EXTRA 1.1. Write bash script for installing Docker. 

2.	Find, download and run any docker container "hello world". (Learn commands and parameters to create/run docker containers.

EXTRA 2.1. Use image with html page, edit html page and paste text: <Username> Sandbox 2021

3.1. Create your Dockerfile for building a docker image. Your docker image should run any web application (nginx, apache, httpd). Web application should be located inside the docker image. 

EXTRA 3.1.1. For creating docker image use clear basic images (ubuntu, centos, alpine, etc.)

3.2. Add an environment variable "DEVOPS=<username> to your docker image 

EXTRA 3.2.1. Print environment variable with the value on a web page (if environment variable changed after container restart - the web page must be updated with a new value)

4. Push your docker image to docker hub (https://hub.docker.com/). Create any description for your Docker image. 

EXTRA 4.1. Integrate your docker image and your github repository. Create an automatic deployment for each push. (The Deployment can be in the “Pending” status for 10-20 minutes. This is normal).


5.  Create docker-compose file. Deploy a few docker containers via one docker-compose file. 
-	first image - your docker image from the previous step. 5 nodes of the first image should be run;
-	second image - any java application;
-	last image - any database image (mysql, postgresql, mongo or etc.).
Second container should be run right after a successful run of a database container.

EXTRA 5.1. Use env files to configure each service.


The task results is the docker/docker-compose files in your GitHub repository


## [Task 5: Ansible for beginners](Task5)
 
Important points:
 
1. Read documentation about System configuration management.
2. Learn about the advantages and disadvantages of Ansible over other tools.
3. Become familiar with ansible basics and YAML syntax.
4. Basics of working with Ansible from the official documentation

EXTRA Read the Jinja2 templating documentation
 
Tasks:
Deploy three virtual machines in the Cloud. Install Ansible on one of them (control_plane).
Ping pong - execute the built-in ansible ping command. Ping the other two machines.
My First Playbook: write a playbook for installing Docker on two machines and run it.

EXTRA 1. Write a playbook for installing Docker and one of the (LAMP/LEMP stack, Wordpress, ELK, MEAN - GALAXY do not use) in Docker.

EXTRA 2. Playbooks should not have default creds to databases and/or admin panel.

EXTRA 3. For the execution of playbooks, dynamic inventory must be used (GALAXY can be used).
 
The result of this task will be ansible files in your GitHub.
 

## [Task 6: Jenkins. Automate, Manage and Control](Task6)
 
Important points:
1.	Read about Jenkins. What is Jenkins and what is it used for? Ways of using. What is a declarative and imperative approach? 
 
Tasks:
1. Install Jenkins. It must be installed in a docker container.
2. Install necessary plugins (if you need).
3. Configure several (2-3) build agents. Agents must be run in docker.
4. Create a Freestyle project. Which will show the current date as a result of execution.
5. Create Pipeline which will execute docker ps -a in docker agent, running on Jenkins master’s Host.
6. Create Pipeline, which will build artefact using Dockerfile directly from your github repo (use Dockerfile from previous task).
7. Pass  variable PASSWORD=QWERTY! To the docker container. Variable must be encrypted!!!

 
EXTRA:
1. Create a pipeline, which will run a docker container from Dockerfile at the additional VM.
2. Create an ansible playbook, which will deploy Jenkins.
3. Deploy a local docker registry, upload a docker image there, download img from your local docker registry and run the container.
4. Configure integration between Jenkins and your Git repo. Jenkins project must be started automatically if you push or merge to master, you also must see Jenkins last build status(success/unsuccess)   in your Git repo.

## [Task 7: Logging & Monitoring](Task7)

Tasks:
1. Zabbix:
Big brother is watching  ....

1.1 Install on server, configure web and base

1.2 Prepare VM or instances. Install Zabbix agents on previously prepared servers or VM.

EXTRA 1.2.1: Complete this task using ansible

1.3 Make several of your own dashboards, where to output data from your triggers (you can manually trigger it)

1.4 Active check vs passive check - use both types.

1.5 Make an agentless check of any resource (ICMP ping)

1.6 Provoke an alert - and create a Maintenance instruction

1.7 Set up a dashboard with infrastructure nodes and monitoring of hosts and software installed on them

2. ELK:
Nobody is forgotten and nothing is forgotten.

2.1 Install and configure ELK

2.2 Organize collection of logs from docker to ELK and receive data from running containers

2.3 Customize your dashboards in ELK

EXTRA 2.4: Set up filters on the Logstash side (get separate docker_container and docker_image fields from the message field)

2.5 Configure monitoring in ELK, get metrics from your running containers

2.6 Study features and settings

3. Grafana:

3.1 Install Grafana

3.2 Integrate with installed ELK

3.3 Set up Dashboards

3.4 Study features and settings

## [Task 8: K8s, Clouds, CI/CD. Just do it!](Task8)

**Important points:**

1. After the completion of development you will show a presentation of the project (Share screen + documentation).

Tasks:
1. Select an application from the list  (pay attention to the date of the last change in the project ): https://github.com/unicodeveloper/awesome-opensource-apps
2. Select an CI/CD. You can choose any option, but we recommend looking here: 
https://pages.awscloud.com/awsmp-wsm-dev-workshop-series-module3-evolving-to-continuous-deployment-ty.html
3. Select Cloud Service provider for your infrastructure.

What would we like to see? The created infrastructure in which it will be possible to build, deploy and test the application.  

**The main things to look out for** 
- Git integration;
- Setup/configure CI/CD;
- Application/s should be containerized;
- Scheduled backups for DB and all critical data;
- Logging and monitoring for your services;
- Security;
- Use Kubernetes as an orchestration (cloud provider is recommended);
- The project must be documented, step-by-step guides to deploy from scratch; 
- EXTRA: SonarQube integration.

