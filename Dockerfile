# Resilio Sync
#
# VERSION               0.1
#

FROM ubuntu
RUN mkdir -p /home/sync/
RUN mkdir -p /home/sync/conf/
RUN mkdir -p /home/sync/data/
ADD https://download-cdn.resilio.com/2.5.11/linux-x64/resilio-sync_x64.tar.gz /home/
RUN tar -xf /home/sync.tgz -C /home/ rslsync && rm -f /home/sync.tgz
COPY sync.conf /home/sync/conf/
RUN /home/rslsync --nodaemon --config /home/sync/conf/sync.conf
EXPOSE 8888
EXPOSE 55555
