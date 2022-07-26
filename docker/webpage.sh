#!/bin/bash
echo "<html><head><title>Exadel -Task4</title></head><body><h1>DEVOPS: $DEVOPS <h1></body></html>" > /var/www/html/index.html
apachectl -DFOREGROUND 