# https://docs.docker.com/engine/reference/builder/
FROM ubuntu:latest

RUN apt update
RUN apt install -y ssh 
RUN apt install -y net-tools 
RUN apt install -y iptables 
RUN apt install -y curl 
RUN apt install -y wget 
RUN apt install -y ufw 
RUN apt install -y vim 
RUN apt install -y systemctl 
RUN apt install -y nmap 
RUN apt install -y git
RUN apt install -y sudo

RUN /bin/bash -c "mkdir ~/.ssh&& chmod 700 ~/.ssh&& touch ~/.ssh/authorized_keys&& chmod 600 ~/.ssh/authorized_keys"

RUN adduser --home /home/ubuntu ubuntu
USER ubuntu
RUN /bin/bash -c "mkdir ~/.ssh&& chmod 700 ~/.ssh&& touch ~/.ssh/authorized_keys&& chmod 600 ~/.ssh/authorized_keys"

USER root
ENTRYPOINT /bin/bash -c "service ssh start && /bin/bash"

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 3000
EXPOSE 5000