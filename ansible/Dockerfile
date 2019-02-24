FROM debian:stretch-slim
LABEL maintainer="Jean-Yves CAMIER <jycamier@clever-age.com>"

### You can add multiple rsa keys separated by ':'
ENV RSA_KEYS /root/.ssh/id_rsa:/root/.ssh/id_rsa2:/root/.ssh/id_rsa3

RUN apt-get update && \
    apt-get install -y gnupg && \
    ## https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-debian
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && \
    apt-get install -y ansible

COPY files/ /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["ansible-playbook", "--version"]