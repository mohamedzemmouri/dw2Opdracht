FROM ubuntu:20.04

RUN apt update && apt install -y apache2

RUN ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime

COPY html /var/www/html/

WORKDIR /var/www/html/

RUN echo $(date) > /var/www/html/buildtime.txt

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
