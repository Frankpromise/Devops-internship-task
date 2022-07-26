sudo yum install httpd
sudo systemctl start httpd

echo "<!DOCTYPE html>
<html lang=\"en\">
\t<head>
 \t\t   <meta charset=\"UTF-8\">
\t\t    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
\t\t    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
\t\t    <title>Exadel Internship</title>
\t</head>\n
\t<body onload=\"script();\">
    <h1>HELLO WORLD!</h1>
<html>
" > /var/www/html/index.html
echo " os version is: $(cat /etc/*-release)" >> /var/www/html/index.html
