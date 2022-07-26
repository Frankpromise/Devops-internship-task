FROM debian:buster-slim

ENV DEVOPS "ubuntu"

RUN apt-get update \
&& apt-get install -y apache2 \ 
&& service apache2 restart \
&& rm /var/www/html/index.html 

COPY ./webpage.sh /usr/local/bin/webpage.sh

RUN chmod a+x /usr/local/bin/webpage.sh

ENTRYPOINT ["webpage.sh"]

EXPOSE 80