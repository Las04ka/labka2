#!/bin/bash
yum -y update
yum -y install httpd

service httpd start
chkconfig httpd on