# https://docs.docker.com/engine/reference/builder/
FROM ubuntu:latest

ENV USER_NAME=ubuntu
ENV HOME_DIR=/home/$USER_NAME

USER root

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
RUN apt install -y zip

# authorized_keys 파일 생성
RUN /bin/bash -c "mkdir ~/.ssh&& chmod 700 ~/.ssh&& touch ~/.ssh/authorized_keys&& chmod 600 ~/.ssh/authorized_keys"

# 계정생성
RUN adduser --home $HOME_DIR $USER_NAME
# 생성된 계정에 sudo
RUN /bin/bash -c "echo '$USER_NAME ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers.d/sudousers"

USER $USER_NAME

# authorized_keys 파일 생성
RUN /bin/bash -c "mkdir ~/.ssh&& chmod 700 ~/.ssh&& touch ~/.ssh/authorized_keys&& chmod 600 ~/.ssh/authorized_keys"

USER root

ENTRYPOINT /bin/bash -c "service ssh start && /bin/bash"

EXPOSE 22