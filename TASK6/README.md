# JENKINS 



## Install Jenkins. It must be installed in a docker container

1. launched a centos vm with ssh access to my ip
2. Installed docker on centos vm
3. pulled the jenkins docker image from dockerhub

```
docker image pull jenkins/jenkins
```
4. mkdir jenkins
5. set up a docker container from the jenkins image

```
docker run -p 8080:8080 -p 50000:50000 -v /your/home:/var/jenkins_home jenkins
```
6. to check jenkins is properly running:

```
 curl http://localhost:8080
```
<img width="840" alt="image" src="https://user-images.githubusercontent.com/107506005/177617988-09dc3dec-c8aa-4279-b10b-590e91a22bce.png">

<img width="820" alt="image" src="https://user-images.githubusercontent.com/107506005/177619956-9a02ea86-bb12-4723-931d-0980cc39a751.png">


## 2. Install necessary plugins (if you need).

<img width="910" alt="image" src="https://user-images.githubusercontent.com/107506005/177621230-63d7c11c-a533-4ecf-9472-817deb4536e1.png">






## 3. Configure several (2-3) build agents. Agents must be run in docker.

<img width="947" alt="image" src="https://user-images.githubusercontent.com/107506005/177626723-ca1396c3-8f91-40eb-a842-aeefc7d303d2.png">


<img width="920" alt="image" src="https://user-images.githubusercontent.com/107506005/177659023-0b45d350-f4f3-412e-84b6-40b7cafcb0c9.png">
<img width="909" alt="image" src="https://user-images.githubusercontent.com/107506005/177661451-5b64bb1b-3f5e-4ce3-8de3-d944626f7bf7.png">



