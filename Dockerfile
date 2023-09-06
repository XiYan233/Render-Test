FROM cloudreve/cloudreve AS copyfile

RUN apk add jq findutils curl wget
#RUN wget -N git.io/aria2.sh && chmod +x aria2.sh
RUN rm -rf /var/cache/apk/* /tmp/*

FROM p3terx/aria2-pro

COPY --from=copyfile /cloudreve/cloudreve /cloudreve/cloudreve
#RUN curl -fsSL git.io/aria2c.sh

ENV RCLONE_CONFIG=/config/rclone.conf \
    UPDATE_TRACKERS=true \
    CUSTOM_TRACKER_URL= \
    LISTEN_PORT=6888 \
    RPC_PORT=6800 \
    RPC_SECRET=11a32938ccc0cfc2887b \
    PUID= PGID= \
    DISK_CACHE= \
    IPV6_MODE= \
    UMASK_SET= \
    SPECIAL_MODE=
#FROM p3terx/aria2-pro

#RUN apk add wget tar && wget https://github.com/cloudreve/Cloudreve/releases/download/3.8.2/cloudreve_3.8.2_linux_amd64.tar.gz && tar -zxvf cloudreve_3.8.2_linux_amd64.tar.gz && chmod +x /app
#COPY --from=builder /cloudreve/cloudreve /app

#WORKDIR /app

#RUN wget https://raw.githubusercontent.com/XiYan233/Render-Test/main/conf.ini

#ADD conf.ini /app

RUN chmod +x /cloudreve

ENTRYPOINT ["/cloudreve/cloudreve"]

EXPOSE 5212
