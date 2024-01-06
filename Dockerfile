ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache tftp-hpa && \
    mkdir -p -m 0755 /tftpboot && \
    find /tftpboot -type f -exec chmod 444 {} \;  && \
    find /tftpboot -mindepth 1 -type d -exec chmod 555 {} \;

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
