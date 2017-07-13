# A basic apache server. To use either add or bind mount content under /var/www
FROM ubuntu:12.04

MAINTAINER  BJ version: 0.1

RUN export TERM=xterm
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/* && apt-get -qq update && apt-get install lsof && apt-get install net-tools


ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
