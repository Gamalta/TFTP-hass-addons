#!/usr/bin/with-contenv bashio

echo "Starting server."
echo "Sharing files:"
ls /tftpboot

in.tftpd -L -vvv -u ftp --secure /tftpboot
