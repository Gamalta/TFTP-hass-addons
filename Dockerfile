ARG BUILD_FROM
FROM $BUILD_FROM

# Install tftp-hpa and tree
RUN apk add --no-cache tftp-hpa tree

# Create tftp server directory, system group and user own tftp server directory
RUN mkdir -p -m 0755 /srv/tftp && \
    addgroup -S tftpd && \
    adduser -s /bin/false -S -D -H -h /srv/tftp -G tftpd tftpd

# Copy start script
COPY start.sh /

# Make start.sh executable
RUN chmod a+x /start.sh

# Exposer le port 69/udp
EXPOSE 69/udp

# Start tftp server
CMD [ "/start.sh" ]