# Resilio Sync
#
# VERSION               0.1
#

FROM ubuntu
MAINTAINER Resilio Inc. <support@resilio.com>
LABEL com.resilio.version="2.5.11"
ENV DEBIAN_FRONTEND noninteractive
RUN mkdir -p /mnt/sync
RUN mkdir -p /mnt/sync/folders
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get install -y sshpass unzip
WORKDIR "/mnt/sync/"
RUN mkdir mkdir -p /mnt/sync/data/
ADD config .	
ADD sync.conf .
ADD https://download-cdn.resilio.com/2.5.11/linux-x64/resilio-sync_x64.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/bin rslsync && rm -f /tmp/sync.tgz

#COPY sync.conf.default /etc/
COPY run_sync /usr/bin/

EXPOSE 8888
EXPOSE 55555

VOLUME /mnt/sync/

ENTRYPOINT ["run_sync"]
CMD ["--config", "/mnt/sync/sync.conf"]
