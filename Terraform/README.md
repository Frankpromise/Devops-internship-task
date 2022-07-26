# TASK3

## LIST OF FILES CONTENT

### __output.tf__ files contains output of congiurations.

### __providers.tf__ contains the aws configuration
### __security.tf__ contains security group configuration
### __vpc.tf__ contains configuration for vpc
### __instance.tf__ contains configuration for both instance
### __script.sh__ contains configuration to install docker and apache
### __variables.tf__ contains referenced variables


## task mandatory
First thing i did was to set up my backend in terraform cloud. This way my terraform state file will be stored remotely and not on my workspace.
Then went ahead to configure aws provider. This is contained in __providers.tf__

Then i set up a vpc configuration to attach both instance. ubuntu will be contained in a public subnet while centos in a private subnet

![image](https://user-images.githubusercontent.com/107506005/175815547-0c1538ac-ecac-4598-a6e2-e40989a50fd8.png)


#### 1. Create EC2 Instance

![image](https://user-images.githubusercontent.com/107506005/175815120-d32e50ba-ab5c-41ab-8454-57fafc166e53.png)

The variables are contained in the __variables.tf__ file

#### 2. EC2 Ubuntu must have Internet access, there must be incoming access: ICMP, TCP/22, 80, 443, and any outgoing access. 
### 3. EC2 CentOS should not have access to the Internet, but must have outgoing and incoming access: ICMP, TCP/22, TCP/80, TCP/443 only on the local network where EC2 Ubuntu, EC2 CentOS is located.

![image](https://user-images.githubusercontent.com/107506005/175815216-491abdb3-d1ae-4b33-a189-6124b6dea73b.png)


#### 4.  On EC2 Ubuntu, install a web server (nginx/apache);
#### Create a web page with the text “Hello World” and information about the current version of the operating system. This page must be visible from the Internet. 
#### On EC2 Ubuntu install Docker, installation should be done according to the recommendation of the official Docker manuals 

![image](https://user-images.githubusercontent.com/107506005/175815699-67d6b564-1344-49e5-9c70-1f546c51b0e3.png)

<img width="837" alt="image" src="https://user-images.githubusercontent.com/107506005/175816640-48fa30ac-f14f-4703-96cf-df421b421450.png">





