#!/usr/bin/env sh
echo ""
echo "----------------------------------------"
echo " Starting tftpd,                        "
echo "                                        "
echo "Starting server."
echo "Sharing files:"
ls /srv/tftp
echo "                                        "
echo "                                        "
echo "----------------------------------------"
echo ""

in.tftpd -u tftpd --foreground --address 0.0.0.0:69 --secure /srv/tftp