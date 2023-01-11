#! /bin/sh

echo "Start sshd"
/usr/sbin/sshd -D &

echo "Start php-fpm"
/usr/local/sbin/php-fpm
