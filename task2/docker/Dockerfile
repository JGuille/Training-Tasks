FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y mysql-client \
    telnet \
    net-tools \
    curl \
    iputils-ping \
    netcat \
    redis-tools \
    default-jre

RUN apt install -y python3-pip

RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

COPY loadout-task2.json /root/loadout-task2.json
COPY backup-script.sh /root/backup-script.sh

RUN gcloud config set project loadout-incoming && \
    gcloud auth activate-service-account --key-file /root/loadout-task2.json

CMD [ "/bin/bash", "-c", "tail -f /dev/null" ]