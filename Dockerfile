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
 squirrelmail \
 squirrelmail-locales \
 supervisor \
 vim \
 w3m

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install postfix dovecot-imapd

# ssh
RUN mkdir /var/run/sshd/
RUN mkdir /root/.ssh
ADD authorized_keys /root/.ssh/authorized_keys
RUN perl -i -ple 's/^(permitrootlogin\s)(.*)/\1yes/i' /etc/ssh/sshd_config

# squirrelmail
ADD etc/000-default.conf /etc/apache2/sites-available/000-default.conf
ADD etc/apache.conf /etc/squirrelmail/apache.conf

# supervisor
ADD blackhole.conf /etc/supervisor/conf.d/blackhole.conf
EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
