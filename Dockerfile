FROM d3fk/s3cmd:stable

ADD .s3cfg /.s3cfg
ADD entrypoint.sh /entrypoint.sh
RUN ln -s /.s3cfg /root/.s3cfg && apk add openssl curl jq --no-cache --upgrade grep

ENTRYPOINT ["/entrypoint.sh"]
