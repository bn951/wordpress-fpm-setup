FROM opsline/tools:latest AS tools

FROM openresty/openresty:xenial

COPY --from=tools /usr/local/bin/envstache /usr/local/bin

ADD ./templates /templates
ADD ./docker-entry.sh /docker-entry.sh

RUN chmod +x /docker-entry.sh

RUN mkdir /nginx

COPY ./etc/nginx/fastcgi_params /nginx/fastcgi_params

ENTRYPOINT [ "/docker-entry.sh" ]
