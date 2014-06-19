FROM tianon/centos:6.5

MAINTAINER White Ops

RUN mkdir /build

ADD build/my_init/sbin/my_init
ADD build/container_environment.tgz /etc

ADD build/epel /build/epel
RUN /build/epel/install.sh 

ADD build/runit /build/runit
RUN /build/runit/install.sh

RUN yum install -y vixie-cron
RUN mkdir /etc/service/cron
ADD build/cron.sh /etc/service/cron/run

## Remove useless cron entries.
RUN rm -f /etc/cron.daily/standard		# Checks for lost+found and scans for mtab.

ADD build/sshd /build/sshd
RUN /build/sshd/install.sh

ADD build/syslog-ng /build/syslog-ng
RUN /build/syslog-ng/install.sh

RUN yum install -y python-pip
RUN pip install argparse

CMD ["/sbin/my_init", "--", "/bin/bash"]

