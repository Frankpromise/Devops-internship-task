#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo apt install php -y
sudo rm /var/www/html/index.html

#Docker installation
sudo apt-get -y update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
   <meta charset=\"UTF-8\">
  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>Exadel Internship</title>
</head>
<body onload=\"script();\">
    <h1>HELLO WORLD!</h1>
<p><?php echo(\"This server is running on: \".PHP_OS);?></p>
<p><?php echo php_uname();?></p>
<strong>Your system is: </strong><p id=\"OS\"></p>
<script>
   HTMLDocument.prototype.e = document.getElementById;
    var os = document.e(\"OS\");
    var Name =  navigator.appVersion;
    window.addEventListener(\"load\", function(){
    os.innerHTML = Name;
    });
</script>
</body>
</html>
" > /var/www/html/index.php