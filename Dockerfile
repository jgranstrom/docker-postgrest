FROM ubuntu:14.04

RUN apt-get update && apt-get install --no-install-recommends -y xz-utils curl libpq-dev libgmp3-dev && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L --insecure https://github.com/begriffs/postgrest/releases/download/v0.3.1.0/postgrest-0.3.1.0-ubuntu.tar.xz \
    | tar -xJO > /usr/local/bin/postgrest \ 
    && chmod u+x /usr/local/bin/postgrest 

EXPOSE 3000

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

CMD ["/entrypoint.sh"]