#!/bin/bash
service php7.3-fpm start
echo $? > /etc/php/7.3/fpm/log.txt