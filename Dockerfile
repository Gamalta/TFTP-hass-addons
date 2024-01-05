ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache tftp-hpa

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
