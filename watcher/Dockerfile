FROM ubuntu

RUN apt-get update && \
    apt-get install -y inotify-tools

ADD entrypoint.sh /entrypoint.sh
RUN chmod 750 /entrypoint.sh

CMD ["/entrypoint.sh"]
