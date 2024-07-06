FROM ubuntu:22.04

RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list


# Setup Program
RUN apt-get update &&\ 
    apt-get -y upgrade &&\
    mkdir -p /run/sshd &&\
    apt-get install -y sudo\
                        vim\
                        unzip\
                        nano\ 
                        wget\ 
                        curl\
                        net-tools\ 
                        git\
                        openssh-server
                        python3\
                        python3-pip

RUN pip3 install torch torchvision

# User Setup
ENV PASSWORD "Hosting"

RUN useradd -ms /bin/bash -d /home/Hosting Hosting&&\
    usermod -aG sudo Hosting

RUN mkdir /home/Hosting/workspace &&\
    chmod 777 /home/Hosting/workspace

WORKDIR /home/Hosting/workspace
RUN ssh-keygen -A

CMD echo "Hosting":$PASSWORD | chpasswd && /usr/sbin/sshd -D