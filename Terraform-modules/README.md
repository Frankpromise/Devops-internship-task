# TASK3 

## LISTING FOLDER CONTENT

#### 1. networking module contains a main.tf for vpc configuration, variables.tf and output.tf to be consumed by the root main.tf
#### 2. locals.tf contains all security group configurations
#### 3. main.tf contains the module for networking and the instance configuration
#### 4. providers.tf
#### 5 . variables.tf for the root module


## Task Extra

### Complete  step 1, but AMI ID cannot be hardcoded. You can hardcode operation system name, version, etc. 

![image](https://user-images.githubusercontent.com/107506005/175817360-02985b34-92bd-4fdd-ba48-8670979534dc.png)

### EC2 CentOS should have outgoing and incoming access: ICMP, TCP/22, TCP/80, TCP/443, only to EC2 Ubuntu. 

![image](https://user-images.githubusercontent.com/107506005/175817446-a83c2106-05ad-468d-9f3d-1f2802597bb3.png)

I also made the security group configuration more dynamic for reusability

![image](https://user-images.githubusercontent.com/107506005/175817540-d7c3802a-4954-4e10-9345-280c42aa9946.png)

### On EC2 CentOS install nginx


To install nginx on a centos private server, the quickest way is to update the pluggins config file in /etc/yum. then install nginx. Since centos is configured to only accept traffic from ubuntu, from the ubuntu server curl the private ip address of centos.
