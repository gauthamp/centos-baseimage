Centos Base Image
=================

An enhanced Centos base image for Docker based on the features from [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker).

Phusion's Ubuntu based base image has become a popular starting point for many Docker images. That base image focuses on correcting some short comings evident in many Docker base images:
- Proper init system, including the proper shutdown of contained processes
- System logger to capture kernel and application log messages
- SSH server to provide access to the container
- Cron daemon for running scheduled tasks
- *runit* for service supervision and management

The centos-baseimage does those things as well but built on top of the Centos Linux distribution.

Rather than reproduce the same user documentation here, you can use the [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker) repository documentation as your guide for configuring and using the base image.

Enjoy!
