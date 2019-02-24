FROM python:3-alpine

ARG ANSIBLE_VERSION=2.7.*
ENV ANSIBLE_VERSION ${ANSIBLE_VERSION}

RUN set -ex \
        && apk add --no-cache -U --virtual .ansible-deps \
            gcc \
            make \
            musl-dev \
            libffi-dev \
            openssl-dev \
        && pip install --no-cache-dir \
            ansible==${ANSIBLE_VERSION} \
            molecule \
        && apk del --no-cache .ansible-deps \
        && apk add --no-cache openssh-client

COPY alpinefiles/ /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["ansible", "--version"]
