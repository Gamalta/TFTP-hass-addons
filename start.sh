#!/usr/bin/with-contenv bashio
set -e
echo ""
echo "----------------------------------------"
echo " Starting tftpd,                        "
echo "                                        "
echo "Starting server."
in.tftpd -u tftpd --foreground --address 0.0.0.0:69 --secure /srv/tftp &
echo "Sharing files:"
ls /srv/tftp
echo "                                        "
echo "                                        "
echo "----------------------------------------"
echo ""

# Read from STDIN
while read -r input; do

    input=$(bashio::jq "${input}" '.')
    bashio::log.info "Read alias: $input"
    echo "Read alias: $input"

    for id in $(bashio::config 'id|keys'); do
        MESSAGE=$(bashio::config "configs[${id}].message")
  
        # Not the correct id
        if ! bashio::var.equals "$id" "$input"; then
            continue
        fi


        #do something
        rm -f /srv/tftp/grub.cfg
        echo "$MESSAGE" > /srv/tftp/grub.cfg

        bashio::log.info "The grub.cfg has been updated successfully to $id"
        echo "The grub.cfg has been updated successfully to $id"
    done
done