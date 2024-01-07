set -e

# Read from STDIN
while read -r input; do

    input=$(bashio::jq "${input}" '.')
    bashio::log.info "Read alias: $input"

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
    done
done