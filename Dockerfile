# Resilio Sync
#
# VERSION               0.1
#

FROM ubuntu
ADD https://download-cdn.resilio.com/2.5.11/linux-x64/resilio-sync_x64.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/bin rslsync && rm -f /tmp/sync.tgz

#COPY sync.conf.default /etc/
COPY run_sync /usr/bin/

EXPOSE 8888
EXPOSE 55555

ENTRYPOINT ["run_sync"]
CMD ["--config", "/mnt/sync/sync.conf"]
