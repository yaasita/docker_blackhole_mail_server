FROM debian:jessie
MAINTAINER yaasita

#apt
ADD 02proxy /etc/apt/apt.conf.d/02proxy
RUN apt-get update
RUN apt-get upgrade -y

#package
RUN apt-get install -y \
 apache2 \
 aptitude \
 git \
 htop \
 libapache2-mod-php5 \
 openssh-server \
 php5 \
 postfix \
 squirrelmail \
 squirrelmail-locales \
 supervisor \
 vim \
 w3m

# squirrelmail
RUN ln -s /etc/squirrelmail/apache.conf /etc/apache2/conf.d/squirrelmail.conf

# supervisor
ADD supervisord.conf /etc/supervisor/conf.d/blackhole.conf
EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
