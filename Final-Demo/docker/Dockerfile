 FROM alpine:3.6

 RUN apk add --update \
 curl \
 mysql-client

 RUN curl -sSL https://sdk.cloud.google.com | bash

 ENV PATH $PATH:/root/google-cloud-sdk/bin

COPY cronjob.json /root/cronjob.json
COPY backup-script.sh /root/backup-script.sh

RUN gcloud config set project loadout-incoming && \
    gcloud auth activate-service-account --key-file /root/cronjob.json

CMD [ "/bin/bash", "-c", "tail -f /dev/null" ]