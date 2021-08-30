FROM docker.io/debian:9-slim

MAINTAINER Simon Urbanek <simon.urbanek@R-project.org>

RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt-get install -q -y apache2 mysql-client mysql-server libdbd-mysql-perl libjson-perl libapache2-mod-svn subversion openbsd-inetd git

RUN groupadd -g 1017 rforge && useradd -u 1017 -g 1017 -m -s /bin/bash rforge && \
    groupadd -g 601 svnuser && useradd -g 601 -u 601 -m -s /bin/bash svnuser

## Apache setup
## Note: we have to enable rforge last, because the mount doesn't exist in the image
##       so no services can be started until the mount is present
RUN ln -s /www/rforge/etc/apache2/sites-available/rforge.conf /etc/apache2/sites-available/rforge.conf && \
  a2enmod rewrite && a2enmod cgi && a2enmod headers && a2dissite 000-default && \
  ln -s /etc/apache2/sites-available/rforge.conf /etc/apache2/sites-enabled/rforge.conf

## MySQL setup
RUN sed -i -e 's:^user.*:user = rforge:' -e 's:datadir.*:datadir = /www/rforge/db:' /etc/mysql/mariadb.conf.d/50-server.cnf && \
  mkdir -p /var/run/mysqld && chown rforge -R /var/log/mysql /var/run/mysqld

## svnserve
RUN echo 'svn stream tcp nowait svnuser /usr/bin/svnserve svnserve -i -r /var/svnroot' >> /etc/inetd.conf

COPY run.sh /root/run.sh

EXPOSE 80 81 3690

CMD bash /root/run.sh
