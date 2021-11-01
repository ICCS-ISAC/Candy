# Build: docker build -t ansible .
# Run: docker run -it -v <your_ssh_folder>:/root/.ssh -v <project_ansible_folder>:/root/ansible ansible
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get update && \
  apt-get install -y gcc python-dev libkrb5-dev && \
  apt-get install -y python3-pip ssh && \
  pip3 install --upgrade pip && \
  pip3 install --upgrade virtualenv && \
  pip3 install pywinrm[kerberos] && \
  apt install krb5-user -y && \ 
  pip3 install pywinrm && \
  pip3 install ansible