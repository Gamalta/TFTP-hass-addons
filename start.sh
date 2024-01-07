#!/usr/bin/with-contenv bashio
set -e
bashio::log.info "----------------------------------------"
bashio::log.info "Starting Addon: $(bashio::addon.name)   "
bashio::log.info "                                        "
bashio::log.info "Starting TFTP server."
in.tftpd -u tftpd --foreground --address 0.0.0.0:69 --secure /srv/tftp &
bashio::log.info "Sharing files:"
ls /srv/tftp
bashio::log.info "                                        "
bashio::log.info "                                        "
bashio::log.info "----------------------------------------"

# Read from STDIN
while read -r input; do
    input=$(bashio::jq "${input}" '.')
    bashio::log.info "Read alias: $input"

    for config in $(bashio::config 'configs|keys'); do
        ID=$(bashio::config "configs[${config}].id")
        MESSAGE=$(bashio::config "configs[${config}].message")
  
        # Not the correct id
        if ! bashio::var.equals "$ID" "$input"; then
            continue
        fi


        #do something
        rm -f /srv/tftp/grub.cfg
        echo "$MESSAGE" > /srv/tftp/grub.cfg

        bashio::log.info "The grub.cfg has been updated successfully to $ID"
    done
done