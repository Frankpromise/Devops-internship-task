# exadel devops

# s3 url: https://myhello2.s3.amazonaws.com/hello.jpg
# webpage url: http://3.93.149.196/

# mandatory task
# 1.created a security group with the necessary pemissions

<img width="917" alt="image" src="https://user-images.githubusercontent.com/107506005/174431645-0645915e-2616-446f-a17e-7ad22e2553d0.png">


# 2. Created key pairs for ssh

# 3. Created  a security for both ec2 to allow ssh, HTTP connection and ping

![image](https://user-images.githubusercontent.com/107506005/174437005-31d57311-1327-4ad6-9f37-0c514d58089b.png)

# 4. I created Ubuntu and Amazon linux 2 instances




# 5.  I checked for ssh connection from my host to the client and made sure I am able to ping both instances

1. Ubuntu host public-IP is: 52.90.40.196
2. AWS linux public-ip is 3.93.149.196
3. second aws linux created in a another vpc connected to Ubuntu host; 34.227.113.38
4. 

<img width="825" alt="image" src="https://user-images.githubusercontent.com/107506005/174438212-36baa506-693d-473b-99aa-79f3d857fe8f.png">

# 6. Installled httpd on linux instance

<img width="616" alt="image" src="https://user-images.githubusercontent.com/107506005/174442436-6f2bd8b0-08eb-41a9-ab1e-d8147a5c6694.png">




# 7. Created an hello-word page with information about OS version



<img width="865" alt="image" src="https://user-images.githubusercontent.com/107506005/174457013-618a62ac-f21e-4089-957d-a1da9a47d283.png">

# 8.  The instance without httpd able to talk to the other
<img width="547" alt="image" src="https://user-images.githubusercontent.com/107506005/174457202-830bbe42-94f5-4658-af59-be45f4c911b4.png">


# EXTRA

# 1. created one more instance in a different vpc with the same security group as the previous one

# 2. successfully logged in to my aws linux using my commandline generated ssh key

<img width="470" alt="image" src="https://user-images.githubusercontent.com/107506005/174472189-31935ccd-6e28-4aaf-a0f4-b38757c0a0ce.png">


# 3. From the aws linux on my ubuntu, i installed httpd to run webpage
<img width="921" alt="image" src="https://user-images.githubusercontent.com/107506005/174473803-b50da79f-9e9d-44ae-a665-12cc4ebf7617.png">


# EXTRA EXTRA

# Created an s3 bucket and made the object publicly accessible using an aws policy generator

<img width="960" alt="image" src="https://user-images.githubusercontent.com/107506005/174474706-f993abcd-6aaa-42f4-bf36-a3ebcbf6bb90.png">
