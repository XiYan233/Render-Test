FROM cloudreve/cloudreve

RUN apk add jq findutils
RUN curl -fsSL git.io/aria2c.sh | bash
RUN rm -rf /var/cache/apk/* /tmp/*

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

#RUN chmod +x /app

#ENTRYPOINT ["/init","&&","/cloudreve"]

#EXPOSE 5212
