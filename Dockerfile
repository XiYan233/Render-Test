FROM cloudreve/cloudreve AS copyfile
FROM p3terx/aria2-pro

#RUN apk add wget tar && wget https://github.com/cloudreve/Cloudreve/releases/download/3.8.2/cloudreve_3.8.2_linux_amd64.tar.gz && tar -zxvf cloudreve_3.8.2_linux_amd64.tar.gz && chmod +x /app
COPY --from=builder /cloudreve/cloudreve /app

WORKDIR /app

RUN wget https://raw.githubusercontent.com/XiYan233/Render-Test/main/conf.ini

#ADD conf.ini /app

RUN chmod +x /app

ENV PUID=0
ENV PGID=0
ENV UMASK_SET=022
ENV RPC_SECRET=DxQ2L5sswVDttGnu0ym68p8wZoRGMjR9
ENV RPC_PORT=6800

ENTRYPOINT ["/init","&&","/cloudreve"]

EXPOSE 5212
