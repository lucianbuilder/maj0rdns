FROM ubuntu:latest


RUN apt update
RUN apt install sniproxy -y
ADD sniproxy.conf /etc/sniproxy.conf
RUN ln -sf /dev/stdout /var/log/sniproxy/sniproxy.log

EXPOSE 80
EXPOSE 443

#public ip of the container

CMD echo "Run sniproxy ..." && \
    sniproxy -c /etc/sniproxy.conf -f
