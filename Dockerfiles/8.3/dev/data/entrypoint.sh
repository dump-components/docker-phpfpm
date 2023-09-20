#! /bin/sh

echo "Start sshd"
echo root | su root /etc/init.d/ssh start

echo "Start php-fpm"
/usr/local/sbin/php-fpm
