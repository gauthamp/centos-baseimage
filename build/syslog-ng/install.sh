#!/bin/bash

## Install a syslog daemon.
yum install -y syslog-ng
mkdir /etc/service/syslog-ng
cp /build/syslog-ng/syslog-ng.sh /etc/service/syslog-ng/run
cp /build/syslog-ng/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

## Install logrotate.
yum install -y logrotate

