FROM centos:centos7

MAINTAINER Gautham P

RUN mkdir /build

ADD build/init_script /sbin/init_script
ADD build/container_environment.tgz /etc

ADD build/epel /build/epel
RUN /build/epel/install.sh 

ADD build/runit /build/runit
RUN /build/runit/install.sh

ADD build/cron /build/cron
RUN /build/cron/install.sh

RUN mkdir /etc/service/cron
ADD build/cron.sh /etc/service/cron/run
## Remove useless cron entries.
RUN rm -f /etc/cron.daily/standard

ADD build/sshd /build/sshd
RUN /build/sshd/install.sh

ADD build/syslog-ng /build/syslog-ng
RUN /build/syslog-ng/install.sh

RUN yum install -y python-pip
RUN pip install argparse

CMD ["/sbin/init_script", "--", "/bin/bash"]

